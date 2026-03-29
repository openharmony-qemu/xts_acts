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

export default function documentTest() {
  describe('ActsCapiDocumentTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedCreateDocumentByHmid_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedCreateDocumentByHmid_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedCreateDocumentByHmid_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedCreateDocumentByHmid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedCreateDocumentByHmid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedCreateDocumentByHmid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedCreateDocumentByFile_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedCreateDocumentByFile_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedCreateDocumentByFile_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedCreateDocumentByFile_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedCreateDocumentByFile_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedCreateDocumentByFile();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedLoadDocumentFromFile_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedLoadDocumentFromFile_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedLoadDocumentFromFile_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedLoadDocumentFromFile_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedLoadDocumentFromFile_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedLoadDocumentFromFile();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDocumentRead_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDocumentRead_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDocumentRead_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDocumentRead_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDocumentRead_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDocumentRead();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDocumentGetHmid_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDocumentGetHmid_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDocumentGetHmid_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDocumentGetHmid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDocumentGetHmid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDocumentGetHmid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDocumentIsLinking_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDocumentIsLinking_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDocumentIsLinking_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDocumentIsLinking_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDocumentIsLinking_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDocumentIsLinking();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDocumentGetNativeFilePath_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDocumentGetNativeFilePath_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDocumentGetNativeFilePath_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDocumentGetNativeFilePath_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDocumentGetNativeFilePath_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDocumentGetNativeFilePath();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDocumentGetRootStorage_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDocumentGetRootStorage_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDocumentGetRootStorage_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDocumentGetRootStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDocumentGetRootStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDocumentGetRootStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDocumentFlush_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDocumentFlush_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDocumentFlush_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDocumentFlush_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDocumentFlush_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDocumentFlush();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDocumentCreateStorage_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDocumentCreateStorage_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDocumentCreateStorage_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDocumentCreateStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDocumentCreateStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDocumentCreateStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageGetStorage_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageGetStorage_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageGetStorage_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageGetStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageGetStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageGetStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageCreateStream_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageCreateStream_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageCreateStream_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageCreateStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageCreateStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageCreateStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageGetStream_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageGetStream_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageGetStream_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageGetStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageGetStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageGetStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageDeleteEntry_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageDeleteEntry_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageDeleteEntry_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageDeleteEntry_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageDeleteEntry_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageDeleteEntry();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDeleteStorage_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDeleteStorage_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDeleteStorage_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDeleteStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDeleteStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDeleteStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStreamRead_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStreamRead_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStreamRead_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStreamRead_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStreamRead_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStreamRead();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStreamWrite_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStreamWrite_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStreamWrite_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStreamWrite_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStreamWrite_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStreamWrite();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStreamSeek_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStreamSeek_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStreamSeek_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStreamSeek_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStreamSeek_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStreamSeek();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStreamGetPosition_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStreamGetPosition_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStreamGetPosition_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStreamGetPosition_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStreamGetPosition_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStreamGetPosition();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStreamGetSize_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStreamGetSize_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStreamGetSize_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStreamGetSize_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStreamGetSize_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStreamGetSize();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDestroyStream_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDestroyStream_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDestroyStream_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDestroyStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDestroyStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDestroyStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedDestroyDocument_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedDestroyDocument_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedDestroyDocument_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedDestroyDocument_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedDestroyDocument_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedDestroyDocument();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageDeleteAllEntry_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageDeleteAllEntry_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageDeleteAllEntry_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageDeleteAllEntry_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageDeleteAllEntry_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageDeleteAllEntry();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageGetHmid_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageGetHmid_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageGetHmid_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageGetHmid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageGetHmid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageGetHmid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageSetHmid_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageSetHmid_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageSetHmid_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageSetHmid_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageSetHmid_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageSetHmid();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageElements_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageElements_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageElements_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageElements_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageElements_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageElements();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageElementsGetCount_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageElementsGetCount_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageElementsGetCount_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageElementsGetCount_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageElementsGetCount_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageElementsGetCount();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageElementGetName_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageElementGetName_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageElementGetName_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageElementGetName_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageElementGetName_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageElementGetName();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageElementGetCTime_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageElementGetCTime_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageElementGetCTime_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageElementGetCTime_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageElementGetCTime_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageElementGetCTime();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageElementGetMTime_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageElementGetMTime_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageElementGetMTime_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageElementGetMTime_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageElementGetMTime_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageElementGetMTime();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageElementIsStorage_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageElementIsStorage_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageElementIsStorage_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageElementIsStorage_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageElementIsStorage_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageElementIsStorage();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageElementIsStream_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageElementIsStream_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageElementIsStream_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageElementIsStream_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageElementIsStream_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageElementIsStream();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.name   SUB_Object_Editor_TestOHContentEmbedStorageCopyTo_0100
     * @tc.number SUB_Object_Editor_TestOHContentEmbedStorageCopyTo_0100
     * @tc.desc   SUB_Object_Editor_TestOHContentEmbedStorageCopyTo_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Object_Editor_TestOHContentEmbedStorageCopyTo_0100', Level.LEVEL0, () => {
      let tag = 'SUB_Object_Editor_TestOHContentEmbedStorageCopyTo_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let result = testNapi.TestOHContentEmbedStorageCopyTo();
      hilog.info(0x0000, 'testTag', '%{public}s end, result: %{public}d', tag, result);
      expect(result).assertEqual(0);
    })
  })
};
