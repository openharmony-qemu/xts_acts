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
import { Driver,ON } from '@ohos.UiTest';

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

function msSleep(sleepMs: number): Promise<void> {
  return new Promise(resolve => {
    setTimeout(resolve, sleepMs);
  });
}

export default function proxyTest() {
  describe('ActsCapiProxyTwoTest', () => {
    beforeAll(async () => {
      await msSleep(1000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('getOEButtonId'));
      hilog.info(0x0000, 'testTag', 'beforeAll begin btn: %{public}s', JSON.stringify(btn));
      if (btn) {
        hilog.info(0x0000, 'testTag', 'beforeAll click btn: %{public}s', JSON.stringify(btn));
        btn.click();
      }
      await msSleep(6000);
      hilog.info(0x0000, 'testTag', 'beforeAll end btn: %{public}s', JSON.stringify(btn));
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100
     * @tc.desc   Test OH_ContentEmbed_GetFormatFromInfo with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetFormatFromInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetFormatFromInfo_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED ||
        result === CE_ERR_NULL_POINTER;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED ||
        result === CE_ERR_NULL_POINTER;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100
     * @tc.desc   Test OH_ContentEmbed_GetIconFromFormat with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetIconFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetIconFromFormat_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContent_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContent_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_GetContent_Normal with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContent_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContent_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContent_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100
     * @tc.desc   Test OH_ContentEmbed_DocumentRead with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_DocumentRead_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestDocumentRead_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetEmbedContent_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetEmbedContent_0100
     * @tc.desc   Test OH_ContentEmbed_GetEmbedContent with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetEmbedContent_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetEmbedContent_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetEmbedContent_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetExtensionInstance_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetExtensionInstance_0100
     * @tc.desc   Test OH_ContentEmbed_GetExtensionInstance with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetExtensionInstance_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetExtensionInstance_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetExtensionInstance_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnCreateFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnCreateFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnCreateFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnCreateFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnCreateFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnCreateFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnDestroyFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnDestroyFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnDestroyFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnDestroyFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnDestroyFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDestroyFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectAttachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnObjectAttachFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectAttachFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectAttachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectAttachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_UnRegisterOnObjectAttachFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectAttachFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionUnRegisterOnObjectAttachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectDetachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnObjectDetachFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectDetachFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnObjectDetachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectDetachFunc_0100
     * @tc.desc   Test OH_ContentEmbed_UnRegisterOnObjectDetachFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectDetachFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_UnRegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionUnRegisterOnObjectDetachFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnWriteToDataStreamFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnWriteToDataStreamFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnWriteToDataStreamFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnWriteToDataStreamFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnWriteToDataStreamFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnWriteToDataStreamFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetSnapshotFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetSnapshotFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnGetSnapshotFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetSnapshotFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetSnapshotFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetSnapshotFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnDoEditFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnDoEditFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnDoEditFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnDoEditFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnDoEditFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDoEditFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetEditStatusFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetEditStatusFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnGetEditStatusFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetEditStatusFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetEditStatusFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetEditStatusFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetCapabilityFunc_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetCapabilityFunc_0100
     * @tc.desc   Test OH_ContentEmbed_RegisterOnGetCapabilityFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetCapabilityFunc_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_RegisterOnGetCapabilityFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetCapabilityFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedDocument_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedDocument_0100
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedDocument with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedDocument_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContentEmbedDocument_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_CallbackToOnUpdate_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_CallbackToOnUpdate_0100
     * @tc.desc   Test OH_ContentEmbed_CallbackToOnUpdate with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_CallbackToOnUpdate_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_CallbackToOnUpdate_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnUpdate_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_CallbackToOnError_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_CallbackToOnError_0100
     * @tc.desc   Test OH_ContentEmbed_CallbackToOnError with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_CallbackToOnError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_CallbackToOnError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnError_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_CallbackToOnEditingFinished_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_CallbackToOnEditingFinished_0100
     * @tc.desc   Test OH_ContentEmbed_CallbackToOnEditingFinished with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_CallbackToOnEditingFinished_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_CallbackToOnEditingFinished_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnEditingFinished_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_CallbackToOnExtensionStopped_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_CallbackToOnExtensionStopped_0100
     * @tc.desc   Test OH_ContentEmbed_CallbackToOnExtensionStopped with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_CallbackToOnExtensionStopped_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_CallbackToOnExtensionStopped_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnExtensionStopped_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_SetSnapshot_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_SetSnapshot_0100
     * @tc.desc   Test OH_ContentEmbed_SetSnapshot with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_SetSnapshot_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_SetSnapshot_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionSetSnapshot_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbility_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbility_0100
     * @tc.desc   Test OH_ContentEmbed_ContextStartSelfUIAbility with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbility_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbility_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbility_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbilityWithStartOptions_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbilityWithStartOptions_0100
     * @tc.desc   Test OH_ContentEmbed_ContextStartSelfUIAbilityWithStartOptions with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbilityWithStartOptions_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ContextStartSelfUIAbilityWithStartOptions_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ContextTerminateAbility_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ContextTerminateAbility_0100
     * @tc.desc   Test OH_ContentEmbed_ContextTerminateAbility with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ContextTerminateAbility_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ContextTerminateAbility_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextTerminateAbility_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_NULL_POINTER ||
        result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_NotSupported_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_NotSupported_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyGetSnapshot with not supported case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_NotSupported_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_NotSupported_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_NotSupported();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_NOT_SUPPORT || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_ExtensionError_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyGetSnapshot with extension error case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyGetSnapshot with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyGetSnapshot_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Error_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Error_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyStartWork with error case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Error_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Error_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStartWork_Error();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_SYSTEM_ABNORMAL || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyStartWork with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyStartWork_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStartWork_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyStopWork_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyStopWork_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyStopWork with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyStopWork_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyStopWork_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStopWork_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_NotSupported_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_NotSupported_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyDoEdit with not supported case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_NotSupported_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_NotSupported_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDoEdit_NotSupported();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_NOT_SUPPORT || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_ExtensionError_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyDoEdit with extension error case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDoEdit_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyDoEdit with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyDoEdit_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDoEdit_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_ExtensionError_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyGetEditStatus with extension error case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyGetEditStatus with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyGetEditStatus_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_ExtensionError_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyGetCapability with extension error case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetCapability_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyGetCapability with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyGetCapability_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetCapability_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_ProxyMultiExtension_Normal_0100
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_ProxyMultiExtension_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_ProxyMultiExtension with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_ProxyMultiExtension_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_ProxyMultiExtension_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyMultiExtension_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK || result === CE_ERR_DEVICE_NOT_SUPPORTED;
      expect(expectResult).assertTrue();
    })
  })
}
