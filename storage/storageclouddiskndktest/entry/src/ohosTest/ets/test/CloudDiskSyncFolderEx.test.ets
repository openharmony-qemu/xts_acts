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

import { describe, it, expect, Level, beforeAll } from "@ohos/hypium";
import clouddisk1 from "libclouddisk1.so";
import picker from "@ohos.file.picker";
import fileShare from "@ohos.fileshare";
import { Driver, ON, Component } from "@ohos.UiTest";

export default function CloudDiskSyncFolderExTest() {
  describe("CloudDiskSyncFolderExTest", () => {
    beforeAll(async (done: Function) => {
      try {
        console.info("====>CloudDiskPlaceholderTest beforeAll start====");
        let documentSelectOptions = new picker.DocumentSelectOptions();
        documentSelectOptions.selectMode = picker.DocumentSelectMode.FOLDER;
        documentSelectOptions.maxSelectNumber = 1;
        let documentPicker = new picker.DocumentViewPicker();
        console.info("====>beforeAll documentPicker.select start");
        let selectPromise = documentPicker.select(documentSelectOptions);
        let driver = await Driver.create();
        await driver.delayMs(3000);
        let inputComp: Component = await driver.findComponent(ON.text("文档"));
        if (inputComp == null || inputComp == undefined) {
          console.error("====>beforeAll input box not found, press back to cancel picker");
          await driver.pressBack();
          done();
          return;
        }
        await inputComp.click();
        inputComp = await driver.findComponent(ON.type("TextInput"));
        await inputComp.click();
        await inputComp.inputText("/storage/Users/currentUser/Documents/");
        console.info("====>beforeAll inputText success");
        await driver.delayMs(1000);
        let selectBtn: Component = await driver.findComponent(ON.text("选择"));
        if (selectBtn == null || selectBtn == undefined) {
          console.error("====>beforeAll select button not found, press back to cancel picker");
          await driver.pressBack();
          done();
          return;
        }
        await selectBtn.click();
        let selectResult = await selectPromise;
        console.info("====>beforeAll selectResult: " + JSON.stringify(selectResult));
        if (selectResult.length < 1) {
          done();
          return;
        }
        let policyInfo: fileShare.PolicyInfo = {
          uri: selectResult[0],
          operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
        };
        await fileShare.persistPermission([policyInfo]);
        console.info("====>beforeAll persistPermission success");
      } catch (err) {
        console.error("====>beforeAll catch err: " + err);
      }
      done();
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderExLifecycle_0100
     * @tc.name CloudDisk_SyncFolderExLifecycle_001
     * @tc.desc Test sync folder ex full lifecycle: registerEx(true) -> getEx(true) -> unregister
     *          -> registerEx(false) -> getEx(false) -> updateAlias -> deactive -> active -> unregister
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderExLifecycle_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderExLifecycle_001 start====");
        let result = clouddisk1.SyncFolderExLifecycle001();
        console.info("====>CloudDisk_SyncFolderExLifecycle_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderExLifecycle_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderEx_0200
     * @tc.name CloudDisk_RegisterSyncFolderEx_002
     * @tc.desc Test RegisterSyncFolderEx with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterSyncFolderEx_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterSyncFolderEx_002 start====");
        let result = clouddisk1.RegisterSyncFolderEx002();
        console.info("====>CloudDisk_RegisterSyncFolderEx_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterSyncFolderEx_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderEx_0300
     * @tc.name CloudDisk_RegisterSyncFolderEx_003
     * @tc.desc Test RegisterSyncFolderEx with sync folder path which is not a directory
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterSyncFolderEx_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterSyncFolderEx_003 start====");
        let result = clouddisk1.RegisterSyncFolderEx003();
        console.info("====>CloudDisk_RegisterSyncFolderEx_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterSyncFolderEx_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderEx_0400
     * @tc.name CloudDisk_RegisterSyncFolderEx_004
     * @tc.desc Test RegisterSyncFolderEx with null pointer
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterSyncFolderEx_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterSyncFolderEx_004 start====");
        let result = clouddisk1.RegisterSyncFolderEx004();
        console.info("====>CloudDisk_RegisterSyncFolderEx_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterSyncFolderEx_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderEx_0500
     * @tc.name CloudDisk_RegisterSyncFolderEx_005
     * @tc.desc Test RegisterSyncFolderEx with invalid version zero
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterSyncFolderEx_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterSyncFolderEx_005 start====");
        let result = clouddisk1.RegisterSyncFolderEx005();
        console.info("====>CloudDisk_RegisterSyncFolderEx_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterSyncFolderEx_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderEx_0600
     * @tc.name CloudDisk_RegisterSyncFolderEx_006
     * @tc.desc Test RegisterSyncFolderEx with unauthorized sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterSyncFolderEx_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterSyncFolderEx_006 start====");
        let result = clouddisk1.RegisterSyncFolderEx006();
        console.info("====>CloudDisk_RegisterSyncFolderEx_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterSyncFolderEx_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderEx_0700
     * @tc.name CloudDisk_RegisterSyncFolderEx_007
     * @tc.desc Test RegisterSyncFolderEx twice on same folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterSyncFolderEx_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterSyncFolderEx_007 start====");
        let result = clouddisk1.RegisterSyncFolderEx007();
        console.info("====>CloudDisk_RegisterSyncFolderEx_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterSyncFolderEx_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_RegisterSyncFolderEx_0800
     * @tc.name CloudDisk_RegisterSyncFolderEx_008
     * @tc.desc Test RegisterSyncFolderEx with empty path string
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_RegisterSyncFolderEx_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_RegisterSyncFolderEx_008 start====");
        let result = clouddisk1.RegisterSyncFolderEx008();
        console.info("====>CloudDisk_RegisterSyncFolderEx_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_RegisterSyncFolderEx_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetSyncFoldersEx_0100
     * @tc.name CloudDisk_GetSyncFoldersEx_001
     * @tc.desc Test GetSyncFoldersEx with null syncFolders output pointer
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetSyncFoldersEx_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetSyncFoldersEx_001 start====");
        let result = clouddisk1.GetSyncFoldersEx001();
        console.info("====>CloudDisk_GetSyncFoldersEx_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetSyncFoldersEx_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_GetSyncFoldersEx_0200
     * @tc.name CloudDisk_GetSyncFoldersEx_002
     * @tc.desc Test GetSyncFoldersEx with null count output pointer
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_GetSyncFoldersEx_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_GetSyncFoldersEx_002 start====");
        let result = clouddisk1.GetSyncFoldersEx002();
        console.info("====>CloudDisk_GetSyncFoldersEx_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_GetSyncFoldersEx_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderExVersionMacro_0100
     * @tc.name CloudDisk_SyncFolderExVersionMacro_001
     * @tc.desc Test OH_CLOUD_DISK_SYNC_FOLDER_EX_VERSION_1 macro value
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderExVersionMacro_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderExVersionMacro_001 start====");
        let result = clouddisk1.Tset_SyncFolderExVersionMacro();
        console.info("====>CloudDisk_SyncFolderExVersionMacro_001 result: " + result);
        expect(result).assertEqual(1);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderExVersionMacro_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderChanges_0100
     * @tc.name CloudDisk_SyncFolderChanges_001
     * @tc.desc Test RegisterSyncFolderChanges twice on same folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderChanges_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderChanges_001 start====");
        let result = clouddisk1.SyncFolderChanges001();
        console.info("====>CloudDisk_SyncFolderChanges_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderChanges_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderChanges_0200
     * @tc.name CloudDisk_SyncFolderChanges_002
     * @tc.desc Test UnregisterSyncFolderChanges without registered listener
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderChanges_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderChanges_002 start====");
        let result = clouddisk1.SyncFolderChanges002();
        console.info("====>CloudDisk_SyncFolderChanges_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderChanges_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderChanges_0300
     * @tc.name CloudDisk_SyncFolderChanges_003
     * @tc.desc Test RegisterSyncFolderChanges with null callback
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderChanges_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>HydratePlaceholder0 start====");
        let result = clouddisk1.SyncFolderChanges003();
        console.info("====>CloudDisk_SyncFolderChanges_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderChanges_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderChanges_0400
     * @tc.name CloudDisk_SyncFolderChanges_004
     * @tc.desc Test RegisterSyncFolderChanges with empty path string
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderChanges_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderChanges_004 start====");
        let result = clouddisk1.SyncFolderChanges004();
        console.info("====>CloudDisk_SyncFolderChanges_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderChanges_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderChanges_0500
     * @tc.name CloudDisk_SyncFolderChanges_005
     * @tc.desc Test UnregisterSyncFolderChanges with empty path string
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderChanges_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderChanges_005 start====");
        let result = clouddisk1.SyncFolderChanges005();
        console.info("====>CloudDisk_SyncFolderChanges_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderChanges_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderExState_0100
     * @tc.name CloudDisk_SyncFolderExState_001
     * @tc.desc Test register sync folder with INACTIVE state and query state transition
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderExState_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderExState_001 start====");
        let result = clouddisk1.SyncFolderExState001();
        console.info("====>CloudDisk_SyncFolderExState_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderExState_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_SyncFolderExAlias_0100
     * @tc.name CloudDisk_SyncFolderExAlias_001
     * @tc.desc Test query custom alias after register and update
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_SyncFolderExAlias_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_SyncFolderExAlias_001 start====");
        let result = clouddisk1.SyncFolderExAlias001();
        console.info("====>CloudDisk_SyncFolderExAlias_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_SyncFolderExAlias_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });
  });
}
