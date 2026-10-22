/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License');
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
 
import { describe, it, expect, Level, beforeAll, afterEach } from "@ohos/hypium";
import clouddisk from "libclouddisk.so";
import { grantDocumentFolderAccess, uSleep } from './CommonUtils';

export default function CloudDiskCallbackTest() {
  describe("CloudDiskCallbackTest", () => {
    beforeAll(async (done: Function) => {
      await grantDocumentFolderAccess(done);
    });

    afterEach(async (done: Function) => {
      await uSleep(200);
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CallbackLifecycle_0100
     * @tc.name CloudDisk_CallbackLifecycle_001
     * @tc.desc Test callback full lifecycle: register -> registerCallbackTable -> hydrate with callback
     *          -> dehydrate with callback -> unregisterCallbackTable -> unregister
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CallbackLifecycle_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CallbackLifecycle_001 start====");
        let result = clouddisk.CallbackLifecycle001();
        console.info("====>CloudDisk_CallbackLifecycle_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CallbackLifecycle_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterCallbackTable_0200
     * @tc.name CloudDisk_RegisterCallbackTable_002
     * @tc.desc Test RegisterCallbackTable twice on same folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterCallbackTable_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterCallbackTable_002 start====");
        let result = clouddisk.RegisterCallbackTable002();
        console.info("====>CloudDisk_RegisterCallbackTable_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterCallbackTable_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterCallbackTable_0300
     * @tc.name CloudDisk_RegisterCallbackTable_003
     * @tc.desc Test RegisterCallbackTable with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterCallbackTable_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterCallbackTable_003 start====");
        let result = clouddisk.RegisterCallbackTable003();
        console.info("====>CloudDisk_RegisterCallbackTable_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterCallbackTable_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterCallbackTable_0400
     * @tc.name CloudDisk_RegisterCallbackTable_004
     * @tc.desc Test RegisterCallbackTable with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterCallbackTable_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterCallbackTable_004 start====");
        let result = clouddisk.RegisterCallbackTable004();
        console.info("====>CloudDisk_RegisterCallbackTable_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterCallbackTable_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterCallbackTable_0500
     * @tc.name CloudDisk_RegisterCallbackTable_005
     * @tc.desc Test RegisterCallbackTable with null callback
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterCallbackTable_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterCallbackTable_005 start====");
        let result = clouddisk.RegisterCallbackTable005();
        console.info("====>CloudDisk_RegisterCallbackTable_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterCallbackTable_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterCallbackTable_0600
     * @tc.name CloudDisk_RegisterCallbackTable_006
     * @tc.desc Test RegisterCallbackTable with empty path string
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterCallbackTable_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterCallbackTable_006 start====");
        let result = clouddisk.RegisterCallbackTable006();
        console.info("====>CloudDisk_RegisterCallbackTable_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterCallbackTable_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnregisterCallbackTable_0200
     * @tc.name CloudDisk_UnregisterCallbackTable_002
     * @tc.desc Test UnregisterCallbackTable without registered callback table
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnregisterCallbackTable_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnregisterCallbackTable_002 start====");
        let result = clouddisk.UnregisterCallbackTable002();
        console.info("====>CloudDisk_UnregisterCallbackTable_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnregisterCallbackTable_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnregisterCallbackTable_0300
     * @tc.name CloudDisk_UnregisterCallbackTable_003
     * @tc.desc Test UnregisterCallbackTable with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnregisterCallbackTable_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnregisterCallbackTable_003 start====");
        let result = clouddisk.UnregisterCallbackTable003();
        console.info("====>CloudDisk_UnregisterCallbackTable_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnregisterCallbackTable_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UnregisterCallbackTable_0400
     * @tc.name CloudDisk_UnregisterCallbackTable_004
     * @tc.desc Test UnregisterCallbackTable with empty path string
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UnregisterCallbackTable_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UnregisterCallbackTable_004 start====");
        let result = clouddisk.UnregisterCallbackTable004();
        console.info("====>CloudDisk_UnregisterCallbackTable_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UnregisterCallbackTable_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0200
     * @tc.name CloudDisk_HydratePlaceholder_002
     * @tc.desc Test HydratePlaceholder cancel with no hydration in progress
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_002 start====");
        let result = clouddisk.HydratePlaceholder002();
        console.info("====>CloudDisk_HydratePlaceholder_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0300
     * @tc.name CloudDisk_HydratePlaceholder_003
     * @tc.desc Test HydratePlaceholder without callback table and file not exist
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_003 start====");
        let result = clouddisk.HydratePlaceholder003();
        console.info("====>CloudDisk_HydratePlaceholder_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0400
     * @tc.name CloudDisk_HydratePlaceholder_004
     * @tc.desc Test HydratePlaceholder with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_004 start====");
        let result = clouddisk.HydratePlaceholder004();
        console.info("====>CloudDisk_HydratePlaceholder_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0500
     * @tc.name CloudDisk_HydratePlaceholder_005
     * @tc.desc Test HydratePlaceholder with high priority and callback triggered
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_005 start====");
        let result = clouddisk.HydratePlaceholder005();
        console.info("====>CloudDisk_HydratePlaceholder_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_DehydrateFile_0200
     * @tc.name CloudDisk_DehydrateFile_002
     * @tc.desc Test DehydrateFile with not fully hydrated placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_DehydrateFile_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_DehydrateFile_002 start====");
        let result = clouddisk.DehydrateFile002();
        console.info("====>CloudDisk_DehydrateFile_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_DehydrateFile_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_DehydrateFile_0300
     * @tc.name CloudDisk_DehydrateFile_003
     * @tc.desc Test DehydrateFile with normal file which is not a placeholder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_DehydrateFile_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_DehydrateFile_003 start====");
        let result = clouddisk.DehydrateFile003();
        console.info("====>CloudDisk_DehydrateFile_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_DehydrateFile_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_DehydrateFile_0400
     * @tc.name CloudDisk_DehydrateFile_004
     * @tc.desc Test DehydrateFile with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_DehydrateFile_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_DehydrateFile_004 start====");
        let result = clouddisk.DehydrateFile004();
        console.info("====>CloudDisk_DehydrateFile_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_DehydrateFile_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0600
     * @tc.name CloudDisk_HydratePlaceholder_006
     * @tc.desc Test HydratePlaceholder on already hydrated file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_006 start====");
        let result = clouddisk.HydratePlaceholder006();
        console.info("====>CloudDisk_HydratePlaceholder_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0700
     * @tc.name CloudDisk_HydratePlaceholder_007
     * @tc.desc Test HydratePlaceholder with null pointer parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_007 start====");
        let result = clouddisk.HydratePlaceholder007();
        console.info("====>CloudDisk_HydratePlaceholder_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0800
     * @tc.name CloudDisk_HydratePlaceholder_008
     * @tc.desc Test HydratePlaceholder without callback table but with placeholder file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_008 start====");
        let result = clouddisk.HydratePlaceholder008();
        console.info("====>CloudDisk_HydratePlaceholder_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_0900
     * @tc.name CloudDisk_HydratePlaceholder_009
     * @tc.desc Test HydratePlaceholder again while hydration in progress
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_009 start====");
        let result = clouddisk.HydratePlaceholder009();
        console.info("====>CloudDisk_HydratePlaceholder_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1000
     * @tc.name CloudDisk_HydratePlaceholder_010
     * @tc.desc Test HydratePlaceholder cancel a suspended hydration task
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_010", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_010 start====");
        let result = clouddisk.HydratePlaceholder010();
        console.info("====>CloudDisk_HydratePlaceholder_010 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_010 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1100
     * @tc.name CloudDisk_HydratePlaceholder_011
     * @tc.desc Test HydratePlaceholder with chunked data fetch and content verification
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_011", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_011 start====");
        let result = clouddisk.HydratePlaceholder011();
        console.info("====>CloudDisk_HydratePlaceholder_011 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_011 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1200
     * @tc.name CloudDisk_HydratePlaceholder_012
     * @tc.desc Test HydratePlaceholder with empty string parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_012", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_012 start====");
        let result = clouddisk.HydratePlaceholder012();
        console.info("====>CloudDisk_HydratePlaceholder_012 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_012 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1300
     * @tc.name CloudDisk_HydratePlaceholder_013
     * @tc.desc Test cancel keeps unhydrated state and cancel again rejected
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_013", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_013 start====");
        let result = clouddisk.HydratePlaceholder013();
        console.info("====>CloudDisk_HydratePlaceholder_013 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_013 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1400
     * @tc.name CloudDisk_HydratePlaceholder_014
     * @tc.desc Test cancel after fully hydrated is rejected
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_014", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_014 start====");
        let result = clouddisk.HydratePlaceholder014();
        console.info("====>CloudDisk_HydratePlaceholder_014 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_014 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1500
     * @tc.name CloudDisk_HydratePlaceholder_015
     * @tc.desc Test fetch data again after task cancelled
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_015", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_015 start====");
        let result = clouddisk.HydratePlaceholder015();
        console.info("====>CloudDisk_HydratePlaceholder_015 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_015 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1600
     * @tc.name CloudDisk_HydratePlaceholder_016
     * @tc.desc Test concurrent cancel of two files does not block each other
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_016", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_016 start====");
        let result = clouddisk.HydratePlaceholder016();
        console.info("====>CloudDisk_HydratePlaceholder_016 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_016 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1700
     * @tc.name CloudDisk_HydratePlaceholder_017
     * @tc.desc Test cross-file request key is rejected by Execute
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_017", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_017 start====");
        let result = clouddisk.HydratePlaceholder017();
        console.info("====>CloudDisk_HydratePlaceholder_017 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_017 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1800
     * @tc.name CloudDisk_HydratePlaceholder_018
     * @tc.desc Test concurrent fetch data of two files executes without blocking
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_018", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_018 start====");
        let result = clouddisk.HydratePlaceholder018();
        console.info("====>CloudDisk_HydratePlaceholder_018 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_018 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePlaceholder_1900
     * @tc.name CloudDisk_HydratePlaceholder_019
     * @tc.desc Test second Execute with same request key is rejected (replay protection)
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePlaceholder_019", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePlaceholder_019 start====");
        let result = clouddisk.HydratePlaceholder019();
        console.info("====>CloudDisk_HydratePlaceholder_019 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePlaceholder_019 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydrateDehydrateIsStatus_0100
     * @tc.name CloudDisk_HydrateDehydrateIsStatus_001
     * @tc.desc Test IsPlaceholderFile status after hydrate and dehydrate
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydrateDehydrateIsStatus_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydrateDehydrateIsStatus_001 start====");
        let result = clouddisk.HydrateDehydrateIsStatus001();
        console.info("====>CloudDisk_HydrateDehydrateIsStatus_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydrateDehydrateIsStatus_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_DehydrateFile_0500
     * @tc.name CloudDisk_DehydrateFile_005
     * @tc.desc Test DehydrateFile denied by application callback
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_DehydrateFile_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_DehydrateFile_005 start====");
        let result = clouddisk.DehydrateFile005();
        console.info("====>CloudDisk_DehydrateFile_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_DehydrateFile_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_DehydrateFile_0600
     * @tc.name CloudDisk_DehydrateFile_006
     * @tc.desc Test DehydrateFile with null pointer parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_DehydrateFile_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_DehydrateFile_006 start====");
        let result = clouddisk.DehydrateFile006();
        console.info("====>CloudDisk_DehydrateFile_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_DehydrateFile_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_DehydrateFile_0700
     * @tc.name CloudDisk_DehydrateFile_007
     * @tc.desc Test DehydrateFile with empty string parameters
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_DehydrateFile_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_DehydrateFile_007 start====");
        let result = clouddisk.DehydrateFile007();
        console.info("====>CloudDisk_DehydrateFile_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_DehydrateFile_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_Execute_0200
     * @tc.name CloudDisk_Execute_002
     * @tc.desc Test Execute with null pointer members outside callback
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_Execute_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_Execute_002 start====");
        let result = clouddisk.Execute002();
        console.info("====>CloudDisk_Execute_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_Execute_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_Execute_0300
     * @tc.name CloudDisk_Execute_003
     * @tc.desc Test Execute with forged request key is rejected
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_Execute_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_Execute_003 start====");
        let result = clouddisk.Execute003();
        console.info("====>CloudDisk_Execute_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_Execute_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_Execute_0400
     * @tc.name CloudDisk_Execute_004
     * @tc.desc Test Execute with zero size fetch data boundary in callback
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_Execute_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_Execute_004 start====");
        let result = clouddisk.Execute004();
        console.info("====>CloudDisk_Execute_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_Execute_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_Execute_0500
     * @tc.name CloudDisk_Execute_005
     * @tc.desc Test Execute with over-boundary offset fetch data in callback
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_Execute_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_Execute_005 start====");
        let result = clouddisk.Execute005();
        console.info("====>CloudDisk_Execute_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_Execute_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CallbackType_ENUM_0100
     * @tc.name CloudDisk_CallbackType_ENUM_001
     * @tc.desc Test OH_CloudDisk_CallbackType enum values
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CallbackType_ENUM_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CallbackType_ENUM_001 start====");
        let result = clouddisk.Tset_CloudDisk_CallbackType_ENUM();
        console.info("====>CloudDisk_CallbackType_ENUM_001 result: " + result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CallbackType_ENUM_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_HydratePriority_ENUM_0100
     * @tc.name CloudDisk_HydratePriority_ENUM_001
     * @tc.desc Test OH_CloudDisk_HydratePriority enum values
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_HydratePriority_ENUM_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_HydratePriority_ENUM_001 start====");
        let result = clouddisk.Tset_CloudDisk_HydratePriority_ENUM();
        console.info("====>CloudDisk_HydratePriority_ENUM_001 result: " + result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>CloudDisk_HydratePriority_ENUM_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });
  });
}