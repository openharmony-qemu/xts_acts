/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
import { describe, it, expect, Level, beforeAll, afterEach } from '@ohos/hypium';
import { grantDocumentFolderAccess, uSleep } from './CommonUtils';

import clouddisk2 from 'libclouddisk2.so';
import picker from '@ohos.file.picker';

export default function CloudDiskPlaceholderStateTest() {
  describe('CloudDiskPlaceholderStateTest', () => {
    beforeAll(async (done: Function) => {
      await grantDocumentFolderAccess(done);
    });

    afterEach(async (done: Function) => {
      await uSleep(200);
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0100
     * @tc.name CloudDisk_GetPlaceholderState_001
     * @tc.desc Test GetPlaceholderState returns UNHYDRATED after create and FULLY_HYDRATED after hydrate
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_001 start====");
        let result = clouddisk2.GetPlaceholderState001();
        console.info("====>CloudDisk_GetPlaceholderState_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0200
     * @tc.name CloudDisk_GetPlaceholderState_002
     * @tc.desc Test GetPlaceholderState returns NONE for a normal file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_002 start====");
        let result = clouddisk2.GetPlaceholderState002();
        console.info("====>CloudDisk_GetPlaceholderState_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0300
     * @tc.name CloudDisk_GetPlaceholderState_003
     * @tc.desc Test GetPlaceholderState with null state pointer
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_003 start====");
        let result = clouddisk2.GetPlaceholderState003();
        console.info("====>CloudDisk_GetPlaceholderState_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0400
     * @tc.name CloudDisk_GetPlaceholderState_004
     * @tc.desc Test GetPlaceholderState with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_004 start====");
        let result = clouddisk2.GetPlaceholderState004();
        console.info("====>CloudDisk_GetPlaceholderState_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0500
     * @tc.name CloudDisk_GetPlaceholderState_005
     * @tc.desc Test GetPlaceholderState returns PARTIALLY_HYDRATED for partially hydrated placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_005 start====");
        let result = clouddisk2.GetPlaceholderState005();
        console.info("====>CloudDisk_GetPlaceholderState_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0100
     * @tc.name CloudDisk_MarkFileAsPlaceholder_001
     * @tc.desc Test MarkFileAsPlaceholder on a normal file succeeds and becomes placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_001 start====");
        let result = clouddisk2.MarkFileAsPlaceholder001();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0200
     * @tc.name CloudDisk_MarkFileAsPlaceholder_002
     * @tc.desc Test MarkFileAsPlaceholder on an existing placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_002 start====");
        let result = clouddisk2.MarkFileAsPlaceholder002();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0300
     * @tc.name CloudDisk_MarkFileAsPlaceholder_003
     * @tc.desc Test MarkFileAsPlaceholder with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_003 start====");
        let result = clouddisk2.MarkFileAsPlaceholder003();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0100
     * @tc.name CloudDisk_UnmarkPlaceholderFile_001
     * @tc.desc Test UnmarkPlaceholderFile on a placeholder succeeds and becomes normal file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_001 start====");
        let result = clouddisk2.UnmarkPlaceholderFile001();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0200
     * @tc.name CloudDisk_UnmarkPlaceholderFile_002
     * @tc.desc Test UnmarkPlaceholderFile on a normal file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_002 start====");
        let result = clouddisk2.UnmarkPlaceholderFile002();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0300
     * @tc.name CloudDisk_UnmarkPlaceholderFile_003
     * @tc.desc Test UnmarkPlaceholderFile with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_003 start====");
        let result = clouddisk2.UnmarkPlaceholderFile003();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0100
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_001
     * @tc.desc Test GetPlaceholderCustomInfo reads back the custom info written at create
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_001 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo001();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0200
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_002
     * @tc.desc Test GetPlaceholderCustomInfo returns NOT_FOUND when created without custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_002 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo002();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0300
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_003
     * @tc.desc Test GetPlaceholderCustomInfo with null buffer and null length pointers
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_003 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo003();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0600
     * @tc.name CloudDisk_GetPlaceholderState_006
     * @tc.desc Test GetPlaceholderState with empty string parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_006 start====");
        let result = clouddisk2.GetPlaceholderState006();
        console.info("====>CloudDisk_GetPlaceholderState_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0700
     * @tc.name CloudDisk_GetPlaceholderState_007
     * @tc.desc Test GetPlaceholderState with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_007 start====");
        let result = clouddisk2.GetPlaceholderState007();
        console.info("====>CloudDisk_GetPlaceholderState_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0800
     * @tc.name CloudDisk_GetPlaceholderState_008
     * @tc.desc Test GetPlaceholderState with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_008 start====");
        let result = clouddisk2.GetPlaceholderState008();
        console.info("====>CloudDisk_GetPlaceholderState_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0400
     * @tc.name CloudDisk_MarkFileAsPlaceholder_004
     * @tc.desc Test MarkFileAsPlaceholder with empty string parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_004 start====");
        let result = clouddisk2.MarkFileAsPlaceholder004();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0500
     * @tc.name CloudDisk_MarkFileAsPlaceholder_005
     * @tc.desc Test MarkFileAsPlaceholder with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_005 start====");
        let result = clouddisk2.MarkFileAsPlaceholder005();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0600
     * @tc.name CloudDisk_MarkFileAsPlaceholder_006
     * @tc.desc Test MarkFileAsPlaceholder with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_006 start====");
        let result = clouddisk2.MarkFileAsPlaceholder006();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0400
     * @tc.name CloudDisk_UnmarkPlaceholderFile_004
     * @tc.desc Test UnmarkPlaceholderFile with empty string parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_004 start====");
        let result = clouddisk2.UnmarkPlaceholderFile004();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0500
     * @tc.name CloudDisk_UnmarkPlaceholderFile_005
     * @tc.desc Test UnmarkPlaceholderFile with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_005 start====");
        let result = clouddisk2.UnmarkPlaceholderFile005();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0600
     * @tc.name CloudDisk_UnmarkPlaceholderFile_006
     * @tc.desc Test UnmarkPlaceholderFile with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_006 start====");
        let result = clouddisk2.UnmarkPlaceholderFile006();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0400
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_004
     * @tc.desc Test GetPlaceholderCustomInfo with empty string parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_004 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo004();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0500
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_005
     * @tc.desc Test GetPlaceholderCustomInfo with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_005 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo005();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0600
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_006
     * @tc.desc Test GetPlaceholderCustomInfo with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_006 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo006();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0700
     * @tc.name CloudDisk_UnmarkPlaceholderFile_007
     * @tc.desc Test UnmarkPlaceholderFile on a partially hydrated placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_007 start====");
        let result = clouddisk2.UnmarkPlaceholderFile007();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0800
     * @tc.name CloudDisk_UnmarkPlaceholderFile_008
     * @tc.desc Test UnmarkPlaceholderFile while hydration in progress
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_008 start====");
        let result = clouddisk2.UnmarkPlaceholderFile008();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0700
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_007
     * @tc.desc Test GetPlaceholderCustomInfo with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_007 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo007();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0800
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_008
     * @tc.desc Test GetPlaceholderCustomInfo on a normal file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_008 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo008();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_0900
     * @tc.name CloudDisk_GetPlaceholderState_009
     * @tc.desc Test GetPlaceholderState returns UNHYDRATED after dehydrate a fully hydrated placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_009 start====");
        let result = clouddisk2.GetPlaceholderState009();
        console.info("====>CloudDisk_GetPlaceholderState_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0700
     * @tc.name CloudDisk_MarkFileAsPlaceholder_007
     * @tc.desc Test MarkFileAsPlaceholder result state is UNHYDRATED and custom info not found
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_007 start====");
        let result = clouddisk2.MarkFileAsPlaceholder007();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0800
     * @tc.name CloudDisk_MarkFileAsPlaceholder_008
     * @tc.desc Test MarkFileAsPlaceholder on a partially hydrated placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_008 start====");
        let result = clouddisk2.MarkFileAsPlaceholder008();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_MarkFileAsPlaceholder_0900
     * @tc.name CloudDisk_MarkFileAsPlaceholder_009
     * @tc.desc Test MarkFileAsPlaceholder while hydration in progress
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_MarkFileAsPlaceholder_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_MarkFileAsPlaceholder_009 start====");
        let result = clouddisk2.MarkFileAsPlaceholder009();
        console.info("====>CloudDisk_MarkFileAsPlaceholder_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_MarkFileAsPlaceholder_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnmarkPlaceholderFile_0900
     * @tc.name CloudDisk_UnmarkPlaceholderFile_009
     * @tc.desc Test UnmarkPlaceholderFile result state is NONE
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnmarkPlaceholderFile_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnmarkPlaceholderFile_009 start====");
        let result = clouddisk2.UnmarkPlaceholderFile009();
        console.info("====>CloudDisk_UnmarkPlaceholderFile_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnmarkPlaceholderFile_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CustomInfoUpdate_0100
     * @tc.name CloudDisk_CustomInfoUpdate_001
     * @tc.desc Test UpdatePlaceholder overwrites the custom info (dev confirmed: B overwrites A)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CustomInfoUpdate_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CustomInfoUpdate_001 start====");
        let result = clouddisk2.CustomInfoUpdate001();
        console.info("====>CloudDisk_CustomInfoUpdate_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CustomInfoUpdate_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderCustomInfo_0900
     * @tc.name CloudDisk_GetPlaceholderCustomInfo_009
     * @tc.desc Test GetPlaceholderCustomInfo with insufficient buffer (dev confirmed: 34400001)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderCustomInfo_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_009 start====");
        let result = clouddisk2.GetPlaceholderCustomInfo009();
        console.info("====>CloudDisk_GetPlaceholderCustomInfo_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderCustomInfo_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetPlaceholderState_1000
     * @tc.name CloudDisk_GetPlaceholderState_010
     * @tc.desc Test state stays PARTIALLY_HYDRATED after cancel (dev confirmed: no rollback)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetPlaceholderState_010", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetPlaceholderState_010 start====");
        let result = clouddisk2.GetPlaceholderState010();
        console.info("====>CloudDisk_GetPlaceholderState_010 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetPlaceholderState_010 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholderAfterHydrate_0100
     * @tc.name CloudDisk_UpdatePlaceholderAfterHydrate_001
     * @tc.desc Test UpdatePlaceholder after fully hydrated (dev confirmed: success)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholderAfterHydrate_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholderAfterHydrate_001 start====");
        let result = clouddisk2.UpdatePlaceholderAfterHydrate001();
        console.info("====>CloudDisk_UpdatePlaceholderAfterHydrate_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholderAfterHydrate_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_PlaceholderState_ENUM_0100
     * @tc.name CloudDisk_PlaceholderState_ENUM_001
     * @tc.desc Test OH_CloudDisk_PlaceholderState enum values
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_PlaceholderState_ENUM_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_PlaceholderState_ENUM_001 start====");
        let result = clouddisk2.Tset_CloudDisk_PlaceholderState_ENUM();
        console.info("====>CloudDisk_PlaceholderState_ENUM_001 result: " + result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>CloudDisk_PlaceholderState_ENUM_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });
  });
}
