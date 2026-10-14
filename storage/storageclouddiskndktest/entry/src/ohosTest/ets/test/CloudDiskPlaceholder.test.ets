/**
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

import { describe, it, expect, Level, beforeAll } from "@ohos/hypium";
import clouddisk from "libclouddisk.so";
import picker from "@ohos.file.picker";
import fileShare from "@ohos.fileshare";
import { Driver, ON, Component } from "@ohos.UiTest";

export default function CloudDiskPlaceholderTest() {
  describe("CloudDiskPlaceholderTest", () => {
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
     * @tc.number SUB_BASIC_FM_CloudDisk_PlaceholderLifecycle_0100
     * @tc.name CloudDisk_PlaceholderLifecycle_001
     * @tc.desc Test placeholder full lifecycle: register -> create -> is(true) -> update -> is(true)
     *          -> convert -> is(false) -> deactive -> unregister
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_PlaceholderLifecycle_001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_PlaceholderLifecycle_001 start====");
        let result = clouddisk.PlaceholderLifecycle001();
        console.info("====>CloudDisk_PlaceholderLifecycle_001 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_PlaceholderLifecycle_001 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0200
     * @tc.name CloudDisk_CreatePlaceholder_002
     * @tc.desc Test CreatePlaceholder with empty relativePath
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_002 start====");
        let result = clouddisk.CreatePlaceholder002();
        console.info("====>CloudDisk_CreatePlaceholder_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0300
     * @tc.name CloudDisk_CreatePlaceholder_003
     * @tc.desc Test CreatePlaceholder with relativePath starting with '/'
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_003 start====");
        let result = clouddisk.CreatePlaceholder003();
        console.info("====>CloudDisk_CreatePlaceholder_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0400
     * @tc.name CloudDisk_CreatePlaceholder_004
     * @tc.desc Test CreatePlaceholder with relativePath ending with '/'
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_004 start====");
        let result = clouddisk.CreatePlaceholder004();
        console.info("====>CloudDisk_CreatePlaceholder_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0500
     * @tc.name CloudDisk_CreatePlaceholder_005
     * @tc.desc Test CreatePlaceholder with relativePath containing './' segment
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_005 start====");
        let result = clouddisk.CreatePlaceholder005();
        console.info("====>CloudDisk_CreatePlaceholder_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0600
     * @tc.name CloudDisk_CreatePlaceholder_006
     * @tc.desc Test CreatePlaceholder with relativePath containing '../' segment
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_006 start====");
        let result = clouddisk.CreatePlaceholder006();
        console.info("====>CloudDisk_CreatePlaceholder_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0700
     * @tc.name CloudDisk_CreatePlaceholder_007
     * @tc.desc Test CreatePlaceholder with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_007 start====");
        let result = clouddisk.CreatePlaceholder007();
        console.info("====>CloudDisk_CreatePlaceholder_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0800
     * @tc.name CloudDisk_CreatePlaceholder_008
     * @tc.desc Test CreatePlaceholder with multi-level dir and zero metadata boundary
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_008 start====");
        let result = clouddisk.CreatePlaceholder008();
        console.info("====>CloudDisk_CreatePlaceholder_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_0900
     * @tc.name CloudDisk_CreatePlaceholder_009
     * @tc.desc Test CreatePlaceholder with max safe integer metadata boundary
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_009 start====");
        let result = clouddisk.CreatePlaceholder009();
        console.info("====>CloudDisk_CreatePlaceholder_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1000
     * @tc.name CloudDisk_CreatePlaceholder_010
     * @tc.desc Test CreatePlaceholder with too long file name
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_010", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_010 start====");
        let result = clouddisk.CreatePlaceholder010();
        console.info("====>CloudDisk_CreatePlaceholder_010 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_010 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1100
     * @tc.name CloudDisk_CreatePlaceholder_011
     * @tc.desc Test CreatePlaceholder with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_011", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_011 start====");
        let result = clouddisk.CreatePlaceholder011();
        console.info("====>CloudDisk_CreatePlaceholder_011 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_011 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1200
     * @tc.name CloudDisk_CreatePlaceholder_012
     * @tc.desc Test CreatePlaceholder with max length file name boundary
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_012", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_012 start====");
        let result = clouddisk.CreatePlaceholder012();
        console.info("====>CloudDisk_CreatePlaceholder_012 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_012 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1300
     * @tc.name CloudDisk_CreatePlaceholder_013
     * @tc.desc Test CreatePlaceholder with zero size metadata
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_013", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_013 start====");
        let result = clouddisk.CreatePlaceholder013();
        console.info("====>CloudDisk_CreatePlaceholder_013 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_013 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1400
     * @tc.name CloudDisk_CreatePlaceholder_014
     * @tc.desc Test CreatePlaceholder with custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_014", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_014 start====");
        let result = clouddisk.CreatePlaceholder014();
        console.info("====>CloudDisk_CreatePlaceholder_014 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_014 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1500
     * @tc.name CloudDisk_CreatePlaceholder_015
     * @tc.desc Test CreatePlaceholder with max length 4096 custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_015", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_015 start====");
        let result = clouddisk.CreatePlaceholder015();
        console.info("====>CloudDisk_CreatePlaceholder_015 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_015 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1600
     * @tc.name CloudDisk_CreatePlaceholder_016
     * @tc.desc Test CreatePlaceholder with over max length 4097 custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_016", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_016 start====");
        let result = clouddisk.CreatePlaceholder016();
        console.info("====>CloudDisk_CreatePlaceholder_016 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_016 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_CreatePlaceholder_1700
     * @tc.name CloudDisk_CreatePlaceholder_017
     * @tc.desc Test CreatePlaceholder with null custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_CreatePlaceholder_017", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_CreatePlaceholder_017 start====");
        let result = clouddisk.CreatePlaceholder017();
        console.info("====>CloudDisk_CreatePlaceholder_017 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_CreatePlaceholder_017 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_IsPlaceholderFile_0200
     * @tc.name CloudDisk_IsPlaceholderFile_002
     * @tc.desc Test IsPlaceholderFile with empty relativePath
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_IsPlaceholderFile_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_IsPlaceholderFile_002 start====");
        let result = clouddisk.IsPlaceholderFile002();
        console.info("====>CloudDisk_IsPlaceholderFile_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_IsPlaceholderFile_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_IsPlaceholderFile_0300
     * @tc.name CloudDisk_IsPlaceholderFile_003
     * @tc.desc Test IsPlaceholderFile with relativePath starting with '/'
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_IsPlaceholderFile_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_IsPlaceholderFile_003 start====");
        let result = clouddisk.IsPlaceholderFile003();
        console.info("====>CloudDisk_IsPlaceholderFile_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_IsPlaceholderFile_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_IsPlaceholderFile_0400
     * @tc.name CloudDisk_IsPlaceholderFile_004
     * @tc.desc Test IsPlaceholderFile with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_IsPlaceholderFile_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_IsPlaceholderFile_004 start====");
        let result = clouddisk.IsPlaceholderFile004();
        console.info("====>CloudDisk_IsPlaceholderFile_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_IsPlaceholderFile_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_IsPlaceholderFile_0500
     * @tc.name CloudDisk_IsPlaceholderFile_005
     * @tc.desc Test IsPlaceholderFile with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_IsPlaceholderFile_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_IsPlaceholderFile_005 start====");
        let result = clouddisk.IsPlaceholderFile005();
        console.info("====>CloudDisk_IsPlaceholderFile_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_IsPlaceholderFile_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_IsPlaceholderFile_0600
     * @tc.name CloudDisk_IsPlaceholderFile_006
     * @tc.desc Test IsPlaceholderFile with relativePath containing './' segment
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_IsPlaceholderFile_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_IsPlaceholderFile_006 start====");
        let result = clouddisk.IsPlaceholderFile006();
        console.info("====>CloudDisk_IsPlaceholderFile_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_IsPlaceholderFile_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_IsPlaceholderFile_0800
     * @tc.name CloudDisk_IsPlaceholderFile_008
     * @tc.desc Test IsPlaceholderFile with null output pointer
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_IsPlaceholderFile_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_IsPlaceholderFile_008 start====");
        let result = clouddisk.IsPlaceholderFile008();
        console.info("====>CloudDisk_IsPlaceholderFile_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_IsPlaceholderFile_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_IsPlaceholderFile_0900
     * @tc.name CloudDisk_IsPlaceholderFile_009
     * @tc.desc Test IsPlaceholderFile with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_IsPlaceholderFile_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_IsPlaceholderFile_009 start====");
        let result = clouddisk.IsPlaceholderFile009();
        console.info("====>CloudDisk_IsPlaceholderFile_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_IsPlaceholderFile_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ConvertPlaceholderToFile_0200
     * @tc.name CloudDisk_ConvertPlaceholderToFile_002
     * @tc.desc Test ConvertPlaceholderToFile with empty relativePath
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_ConvertPlaceholderToFile_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_ConvertPlaceholderToFile_002 start====");
        let result = clouddisk.ConvertPlaceholderToFile002();
        console.info("====>CloudDisk_ConvertPlaceholderToFile_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_ConvertPlaceholderToFile_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ConvertPlaceholderToFile_0300
     * @tc.name CloudDisk_ConvertPlaceholderToFile_003
     * @tc.desc Test ConvertPlaceholderToFile with relativePath starting with '/'
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_ConvertPlaceholderToFile_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_ConvertPlaceholderToFile_003 start====");
        let result = clouddisk.ConvertPlaceholderToFile003();
        console.info("====>CloudDisk_ConvertPlaceholderToFile_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_ConvertPlaceholderToFile_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ConvertPlaceholderToFile_0400
     * @tc.name CloudDisk_ConvertPlaceholderToFile_004
     * @tc.desc Test ConvertPlaceholderToFile with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_ConvertPlaceholderToFile_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_ConvertPlaceholderToFile_004 start====");
        let result = clouddisk.ConvertPlaceholderToFile004();
        console.info("====>CloudDisk_ConvertPlaceholderToFile_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_ConvertPlaceholderToFile_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ConvertPlaceholderToFile_0500
     * @tc.name CloudDisk_ConvertPlaceholderToFile_005
     * @tc.desc Test ConvertPlaceholderToFile with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_ConvertPlaceholderToFile_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_ConvertPlaceholderToFile_005 start====");
        let result = clouddisk.ConvertPlaceholderToFile005();
        console.info("====>CloudDisk_ConvertPlaceholderToFile_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_ConvertPlaceholderToFile_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_ConvertPlaceholderToFile_0600
     * @tc.name CloudDisk_ConvertPlaceholderToFile_006
     * @tc.desc Test ConvertPlaceholderToFile with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_ConvertPlaceholderToFile_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_ConvertPlaceholderToFile_006 start====");
        let result = clouddisk.ConvertPlaceholderToFile006();
        console.info("====>CloudDisk_ConvertPlaceholderToFile_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_ConvertPlaceholderToFile_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0200
     * @tc.name CloudDisk_UpdatePlaceholder_002
     * @tc.desc Test UpdatePlaceholder with empty relativePath
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_002", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_002 start====");
        let result = clouddisk.UpdatePlaceholder002();
        console.info("====>CloudDisk_UpdatePlaceholder_002 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_002 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0300
     * @tc.name CloudDisk_UpdatePlaceholder_003
     * @tc.desc Test UpdatePlaceholder with relativePath starting with '/'
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_003 start====");
        let result = clouddisk.UpdatePlaceholder003();
        console.info("====>CloudDisk_UpdatePlaceholder_003 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_003 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0400
     * @tc.name CloudDisk_UpdatePlaceholder_004
     * @tc.desc Test UpdatePlaceholder with unregistered sync folder
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_004 start====");
        let result = clouddisk.UpdatePlaceholder004();
        console.info("====>CloudDisk_UpdatePlaceholder_004 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_004 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0500
     * @tc.name CloudDisk_UpdatePlaceholder_005
     * @tc.desc Test UpdatePlaceholder with not existed file
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_005 start====");
        let result = clouddisk.UpdatePlaceholder005();
        console.info("====>CloudDisk_UpdatePlaceholder_005 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_005 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0600
     * @tc.name CloudDisk_UpdatePlaceholder_006
     * @tc.desc Test UpdatePlaceholder with zero metadata boundary
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_006", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_006 start====");
        let result = clouddisk.UpdatePlaceholder006();
        console.info("====>CloudDisk_UpdatePlaceholder_006 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_006 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0700
     * @tc.name CloudDisk_UpdatePlaceholder_007
     * @tc.desc Test UpdatePlaceholder with max safe integer metadata boundary
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_007", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_007 start====");
        let result = clouddisk.UpdatePlaceholder007();
        console.info("====>CloudDisk_UpdatePlaceholder_007 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_007 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0800
     * @tc.name CloudDisk_UpdatePlaceholder_008
     * @tc.desc Test UpdatePlaceholder with not existed sync folder path
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_008", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_008 start====");
        let result = clouddisk.UpdatePlaceholder008();
        console.info("====>CloudDisk_UpdatePlaceholder_008 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_008 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_0900
     * @tc.name CloudDisk_UpdatePlaceholder_009
     * @tc.desc Test UpdatePlaceholder with custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_009", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_009 start====");
        let result = clouddisk.UpdatePlaceholder009();
        console.info("====>CloudDisk_UpdatePlaceholder_009 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_009 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_1000
     * @tc.name CloudDisk_UpdatePlaceholder_010
     * @tc.desc Test UpdatePlaceholder with max length 4096 custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_010", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_010 start====");
        let result = clouddisk.UpdatePlaceholder010();
        console.info("====>CloudDisk_UpdatePlaceholder_010 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_010 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_1100
     * @tc.name CloudDisk_UpdatePlaceholder_011
     * @tc.desc Test UpdatePlaceholder with over max length 4097 custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_011", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_011 start====");
        let result = clouddisk.UpdatePlaceholder011();
        console.info("====>CloudDisk_UpdatePlaceholder_011 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_011 catch err: " + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_FM_CloudDisk_UpdatePlaceholder_1200
     * @tc.name CloudDisk_UpdatePlaceholder_012
     * @tc.desc Test UpdatePlaceholder with null custom info
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     * @tc.require
     */
    it("CloudDisk_UpdatePlaceholder_012", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("====>CloudDisk_UpdatePlaceholder_012 start====");
        let result = clouddisk.UpdatePlaceholder012();
        console.info("====>CloudDisk_UpdatePlaceholder_012 result: " + result);
        expect(result).assertEqual(0);
        done();
      } catch (err) {
        console.error("====>CloudDisk_UpdatePlaceholder_012 catch err: " + err);
        expect().assertFail();
        done();
      }
    });
  });
}
