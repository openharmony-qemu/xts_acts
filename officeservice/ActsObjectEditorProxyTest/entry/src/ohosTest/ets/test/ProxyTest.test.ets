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

export default function proxyTest() {
  describe('ActsCapiProxyTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedInfo_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedInfo_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedInfo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedCreateContentEmbedInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedInfo_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedInfo_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedInfo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDestroyContentEmbedInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetContentEmbedInfo_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetContentEmbedInfo_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetContentEmbedInfo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetContentEmbedInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetContentEmbedInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetContentEmbedInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetFormatCountFromInfo_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetFormatCountFromInfo_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetFormatCountFromInfo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetFormatCountFromInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetFormatCountFromInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetFormatCountFromInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetFormatFromInfo_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetFormatFromInfo_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetFormatFromInfo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetFormatFromInfo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetFormatFromInfo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetFormatFromInfo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedFormat_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedFormat_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedFormat_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedCreateContentEmbedFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedCreateContentEmbedFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedFormat_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedFormat_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedFormat_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDestroyContentEmbedFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDestroyContentEmbedFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetContentEmbedFormatByHmidAndLocale();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetHmidFromFormat_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetHmidFromFormat_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetHmidFromFormat_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetHmidFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetHmidFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetHmidFromFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetNameAndDescriptionFromFormat_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetNameAndDescriptionFromFormat_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetNameAndDescriptionFromFormat_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetNameAndDescriptionFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetNameAndDescriptionFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetNameAndDescriptionFromFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetIconFromFormat_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetIconFromFormat_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetIconFromFromFormat_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetIconFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetIconFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetIconFromFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedGetFileNameExtensionsFromFormat_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedGetFileNameExtensionsFromFormat_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedGetFileNameExtensionsFromFormat_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedGetFileNameExtensionsFromFormat_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedGetFileNameExtensionsFromFormat_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedGetFileNameExtensionsFromFormat();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedCreateExtensionProxy_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedCreateExtensionProxy_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedCreateExtensionProxy_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedCreateExtensionProxy_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedCreateExtensionProxy_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedCreateExtensionProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDestroyExtensionProxy_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDestroyExtensionProxy_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDestroyExtensionProxy_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDestroyExtensionProxy_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDestroyExtensionProxy_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDestroyExtensionProxy();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnUpdateFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnUpdateFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnUpdateFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnUpdateFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnUpdateFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyRegisterOnUpdateFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnErrorFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnErrorFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnErrorFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnErrorFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnErrorFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyRegisterOnErrorFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnEditingFinishedFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnEditingFinishedFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnEditingFinishedFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnEditingFinishedFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnEditingFinishedFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyRegisterOnEditingFinishedFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyRegisterOnExtensionStoppedFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyStartWork_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyStartWork_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyStartWork_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyStartWork_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyStartWork_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyStartWork();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyStopWork_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyStopWork_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyStopWork_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyStopWork_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyStopWork_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyStopWork();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyGetSnapshot_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyGetSnapshot_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyGetSnapshot_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyGetSnapshot_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyGetSnapshot_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyGetSnapshot();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyDoEdit_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyDoEdit_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyDoEdit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyDoEdit_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyDoEdit_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyDoEdit();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyGetEditStatus_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyGetEditStatus_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyGetEditStatus_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyGetEditStatus_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyGetEditStatus_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyGetEditStatus();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyGetCapability_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyGetCapability_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyGetCapability_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyGetCapability_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyGetCapability_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyGetCapability();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedProxyGetDocument_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedProxyGetDocument_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedProxyGetDocument_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedProxyGetDocument_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedProxyGetDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedProxyGetDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })
  })
}
