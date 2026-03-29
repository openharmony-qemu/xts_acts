/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
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

export default function extensionTest() {
  describe('ActsCapiExtensionTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnCreateFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnCreateFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnCreateFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnCreateFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnCreateFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnCreateFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDestroyFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDestroyFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDestroyFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDestroyFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDestroyFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnDestroyFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectAttachFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectAttachFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectAttachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnObjectAttachFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectDetachFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectDetachFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectDetachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnObjectDetachFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionUnRegisterOnObjectAttachFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionUnRegisterOnObjectDetachFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnWriteToDataStreamFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnGetSnapshotFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDoEditFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDoEditFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDoEditFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDoEditFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnDoEditFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnDoEditFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnGetEditStatusFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionRegisterOnGetCapabilityFunc();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedContext_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedContext_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionGetContentEmbedContext();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionGetContext_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionGetContext_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionGetContext_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionGetContext_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionGetContext_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionGetContext();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionGetExtensionInstance_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionGetExtensionInstance_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionGetExtensionInstance_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionGetExtensionInstance_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionGetExtensionInstance_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionGetExtensionInstance();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedDocument_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedDocument_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedDocument_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedDocument_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionGetContentEmbedDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionGetContentEmbedDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnUpdate_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnUpdate_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnUpdate_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnUpdate_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnUpdate_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionCallbackToOnUpdate();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnError_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnError_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnError_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnError_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnError_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionCallbackToOnError();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnEditingFinished_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnEditingFinished_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnEditingFinished_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnEditingFinished_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnEditingFinished_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionCallbackToOnEditingFinished();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnExtensionStopped_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnExtensionStopped_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnExtensionStopped_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnExtensionStopped_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionCallbackToOnExtensionStopped_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionCallbackToOnExtensionStopped();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionSetSnapshot_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionSetSnapshot_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionSetSnapshot_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionSetSnapshot_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionSetSnapshot_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionSetSnapshot();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedExtensionContextStartSelfUIAbility_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedExtensionContextStartSelfUIAbility_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedExtensionContextStartSelfUIAbility_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedExtensionContextStartSelfUIAbility_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedExtensionContextStartSelfUIAbility_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedExtensionContextStartSelfUIAbility();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

  })
}
