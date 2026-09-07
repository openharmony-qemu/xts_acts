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
const CE_CAPABILITY_SUPPORT_SNAPSHOT: number = 1;
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
  describe('ActsCapiProxyThreeTest', () => {
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
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0200
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale with invalid locale format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0200',
      Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedFormatByOEidAndLocale_Abnormal_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedFormatByOEidAndLocale_LocaleInvalid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

     /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0200
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0200
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with invalid locale format (part 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0200', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_LocaleInvalid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })
 
    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0300
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0300
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with invalid locale format (part 2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0300', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_LocaleInvalid2();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })
 
    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0400
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0400
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with invalid locale format (part 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0400', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_LocaleInvalid3();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })
 
    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0500
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0500
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with invalid locale format (part 4)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0500', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_LocaleInvalid4();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })
 
    /**
     * @tc.name   SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0600
     * @tc.number SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0600
     * @tc.desc   Test OH_ContentEmbed_GetContentEmbedInfo with invalid locale format (part 5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0600', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_OH_ContentEmbed_GetContentEmbedInfo_0600';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetContentEmbedInfo_LocaleInvalid5();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionGetContent_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionGetContent_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContext with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionGetContent_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionGetContent_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContent_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionGetEmbedContent_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionGetEmbedContent_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContentEmbedContext with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionGetEmbedContent_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionGetEmbedContent_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetEmbedContent_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionGetExtensionInstance_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionGetExtensionInstance_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetExtensionInstance with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionGetExtensionInstance_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionGetExtensionInstance_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetExtensionInstance_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionRegisterOnCreateFunc_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionRegisterOnCreateFunc_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnCreateFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionRegisterOnCreateFunc_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionRegisterOnCreateFunc_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnCreateFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionRegisterOnDestroyFunc_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionRegisterOnDestroyFunc_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDestroyFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionRegisterOnDestroyFunc_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionRegisterOnDestroyFunc_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDestroyFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionRegisterOnWriteToDataStreamFunc_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionRegisterOnWriteToDataStreamFunc_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnWriteToDataStreamFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionRegisterOnWriteToDataStreamFunc_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionRegisterOnWriteToDataStreamFunc_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnWriteToDataStreamFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionRegisterOnGetSnapshotFunc_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionRegisterOnGetSnapshotFunc_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetSnapshotFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionRegisterOnGetSnapshotFunc_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionRegisterOnGetSnapshotFunc_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetSnapshotFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionRegisterOnDoEditFunc_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionRegisterOnDoEditFunc_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnDoEditFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionRegisterOnDoEditFunc_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionRegisterOnDoEditFunc_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnDoEditFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionRegisterOnGetEditStatusFunc_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionRegisterOnGetEditStatusFunc_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetEditStatusFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionRegisterOnGetEditStatusFunc_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionRegisterOnGetEditStatusFunc_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetEditStatusFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionRegisterOnGetCapabilityFunc_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionRegisterOnGetCapabilityFunc_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_RegisterOnGetCapabilityFunc with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionRegisterOnGetCapabilityFunc_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionRegisterOnGetCapabilityFunc_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionRegisterOnGetCapabilityFunc_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionGetContentEmbedDocument_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionGetContentEmbedDocument_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_GetContentEmbedDocument with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionGetContentEmbedDocument_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionGetContentEmbedDocument_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionGetContentEmbedDocument_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionCallbackToOnUpdate_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionCallbackToOnUpdate_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnUpdate with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionCallbackToOnUpdate_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionCallbackToOnUpdate_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnUpdate_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionCallbackToOnError_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionCallbackToOnError_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnError with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionCallbackToOnError_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionCallbackToOnError_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnError_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionCallbackToOnEditingFinished_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionCallbackToOnEditingFinished_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnEditingFinished with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionCallbackToOnEditingFinished_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionCallbackToOnEditingFinished_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnEditingFinished_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionCallbackToOnExtensionStopped_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionCallbackToOnExtensionStopped_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_CallbackToOnExtensionStopped with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionCallbackToOnExtensionStopped_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionCallbackToOnExtensionStopped_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionCallbackToOnExtensionStopped_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionSetSnapshot_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionSetSnapshot_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_SetSnapshot with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionSetSnapshot_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionSetSnapshot_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionSetSnapshot_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionContextStartSelfUIAbility_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionContextStartSelfUIAbility_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextStartSelfUIAbility with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionContextStartSelfUIAbility_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionContextStartSelfUIAbility_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbility_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextStartSelfUIAbilityWithStartOptions with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal_0100',
      Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextStartSelfUIAbilityWithStartOptions_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestExtensionContextTerminateAbility_Normal_0100
     * @tc.number SUB_Object_Editor_TestExtensionContextTerminateAbility_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Extension_ContextTerminateAbility with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestExtensionContextTerminateAbility_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestExtensionContextTerminateAbility_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestExtensionContextTerminateAbility_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyStopWork_Normal_0100
     * @tc.number SUB_Object_Editor_TestProxyStopWork_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_StopWork with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyStopWork_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyStopWork_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStopWork_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyDoEdit_Normal_0100
     * @tc.number SUB_Object_Editor_TestProxyDoEdit_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_DoEdit with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyDoEdit_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyDoEdit_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDoEdit_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetEditStatus_Normal_0100
     * @tc.number SUB_Object_Editor_TestProxyGetEditStatus_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_GetEditStatus with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetEditStatus_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyGetEditStatus_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetCapability_Normal_0100
     * @tc.number SUB_Object_Editor_TestProxyGetCapability_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_GetCapability with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetCapability_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyGetCapability_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetCapability_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetSnapshot_Normal_0100
     * @tc.number SUB_Object_Editor_TestProxyGetSnapshot_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_GetSnapshot with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetSnapshot_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyGetSnapshot_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyStarStartWork_Normal_0100
     * @tc.number SUB_Object_Editor_TestProxyStarStartWork_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_StartWork with normal case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyStarStartWork_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyStarStartWork_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyStartWork_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyDoEdit_NotSupported_0100
     * @tc.number SUB_Object_Editor_TestProxyDoEdit_NotSupported_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_DoEdit with extension not supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyDoEdit_NotSupported_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyDoEdit_NotSupported_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDoEdit_NotSupported();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_NOT_SUPPORT;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyDoEdit_ExtensionError_0100
     * @tc.number SUB_Object_Editor_TestProxyDoEdit_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_DoEdit with extension error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyDoEdit_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyDoEdit_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyDoEdit_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetEditStatus_ExtensionError_0100
     * @tc.number SUB_Object_Editor_TestProxyGetEditStatus_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_GetEditStatus with extension error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetEditStatus_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyGetEditStatus_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetEditStatus_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetCapability_ExtensionError_0100
     * @tc.number SUB_Object_Editor_TestProxyGetCapability_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_GetCapability with extension error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetCapability_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyGetCapability_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetCapability_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetSnapshot_NotSupported_0100
     * @tc.number SUB_Object_Editor_TestProxyGetSnapshot_NotSupported_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_GetSnapshot with extension not supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetSnapshot_NotSupported_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyGetSnapshot_NotSupported_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_NotSupported();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_NOT_SUPPORT;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyGetSnapshot_ExtensionError_0100
     * @tc.number SUB_Object_Editor_TestProxyGetSnapshot_ExtensionError_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy_GetSnapshot with extension error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyGetSnapshot_ExtensionError_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyGetSnapshot_ExtensionError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyGetSnapshot_ExtensionError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_EXTENSION_ERROR;
      expect(expectResult).assertTrue();
    })

    /**
     * @tc.name   SUB_Object_Editor_TestProxyMultiExtension_Normal_0100
     * @tc.number SUB_Object_Editor_TestProxyMultiExtension_Normal_0100
     * @tc.desc   Test OH_ContentEmbed_Proxy with multiple extension instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestProxyMultiExtension_Normal_0100', Level.LEVEL0, async () => {
      await msSleep(1000);
      let tag = 'SUB_Object_Editor_TestProxyMultiExtension_Normal_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestProxyMultiExtension_Normal();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      let expectResult = result === CE_ERR_OK;
      expect(expectResult).assertTrue();
    })
  })
}
