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

import request from "@ohos.request";
import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size  } from "../../../hypium/index";

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from './Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let baseContext: common.UIAbilityContext | undefined;

export default function requestDownloadStageStaticUnit() {
  describe('requestDownloadStageStaticTSUnit', (): void => {
    console.info('====>################################request download Test start');

    /**
     * beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.
     */
    beforeAll(async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, '%{public}s', 'beforeAll start');
        let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        await Utils.msSleep(1000)
        abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.helloworld")
        await Utils.msSleep(4000)
        hilog.info(domain, tag, '%{public}s', 'beforeAll end');
        baseContext = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
        hilog.info(domain, tag, '%{public}s', 'baseContext set success');
        done();
      } catch (err) {
        console.info('====>beforeAll catch err:'+JSON.stringify(err))
        done();
      }
    });

    /**
     * beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.
     */
    beforeEach((): void => {
      console.info('====>beforeEach: Prerequisites is executed.');
    });

    /**
     * afterEach: Test case-level clearance conditions, which are executed after each test case is executed.
     */
    afterEach((): void => {
      console.info('====>afterEach: Test case-level clearance conditions is executed.');
    });

    /**
     * afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed.
     */
    afterAll((): void => {
      console.info('====>afterAll: Test suite-level cleanup condition is executed');
    });


    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0100
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0100
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0100 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0100.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0100.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      request.downloadFile(baseContext!, downloadFileConfig, async (err, downloadTask):void => {
        console.info("====>SUB_Request_downloadStage_Supplemental_Static_0100 downloadTask: " + downloadTask);
        try{
          if(err){
            console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0100 downloadFile error: ${JSON.stringify(err)}`)
            expect().assertFail();
          }
          expect(downloadTask != undefined).assertEqual(true);
          let ifExit = await downloadTask!.delete();
          expect(ifExit === true).assertEqual(true);
          fs.unlinkSync(downloadFilePath);
          let downloadInfo = await downloadTask!.getTaskInfo();
          expect(downloadInfo.description !== undefined).assertTrue();
          expect(downloadInfo.downloadedBytes !== undefined).assertTrue();
          expect(downloadInfo.downloadId !== undefined).assertTrue();
          expect(downloadInfo.failedReason !== undefined).assertTrue();
          expect(downloadInfo.fileName !== undefined).assertTrue();
          expect(downloadInfo.filePath !== undefined).assertTrue();
          expect(downloadInfo.pausedReason !== undefined).assertTrue();
          expect(downloadInfo.status !== undefined).assertTrue();
          expect(downloadInfo.targetURI !== undefined).assertTrue();
          expect(downloadInfo.downloadTitle !== undefined).assertTrue();
          expect(downloadInfo.downloadTotalBytes !== undefined).assertTrue();
          console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0100 end-----------------------");
          done();
        }catch(e){
          console.info("====>SUB_Request_downloadStage_Supplemental_Static_0100 except error: " + e);
        }
      });
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0200
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0200
     * @tc.desc   Starts a download session.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("-----------------------SUB_Request_downloadStage_Supplemental_Static_0200 is starting-----------------------");
      let downloadFilePath = `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0200.txt`
      console.info("====>downloadFileConfig:" + `${baseContext!.tempDir}/SUB_Request_downloadStage_Supplemental_Static_0200.txt`)
      let downloadFileConfig: request.DownloadConfig = {
        url: 'https://gitcode.com/weixin_43862wr7/download/releases/download/v1.0.1/test002.hap',
        header: {
          'headers': 'http'
        },
        enableMetered: false,
        enableRoaming: false,
        description: 'XTS download test!',
        networkType: request.NETWORK_WIFI,
        filePath: downloadFilePath,
        title: 'XTS download test!',
        background: false
      }
      try{
        let downloadTask = await request.downloadFile(baseContext!, downloadFileConfig);
        let ifExit = await downloadTask!.delete();
        expect(ifExit === true).assertEqual(true);
        fs.unlinkSync(downloadFilePath);
        done();
        console.info("====>-----------------------SUB_Request_downloadStage_Supplemental_Static_0200 end-----------------------");
      } catch(err){
        console.info(`====>SUB_Request_downloadStage_Supplemental_Static_0200 except error: ${JSON.stringify(err)}`)
        expect().assertFail();
      }
    });

    /**
     * @tc.name   SUB_Request_downloadStage_Supplemental_Static_0300
     * @tc.number SUB_Request_downloadStage_Supplemental_Static_0300
     * @tc.desc   different index,begins and ends.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_Request_downloadStage_Supplemental_Static_0300',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let File: request.File = {
        filename: 'test',
        name: 'test',
        uri: 'internal://cache/text.txt',
        type: 'txt'
      }

      let RequestData: request.RequestData = {
        name: 'name',
        value: '123'
      }

      let config: request.UploadConfig = {
        url: 'http://127.0.0.1:8080',
        header: { 'Accept': '*/*' },
        method: "POST",
        files: [File],
        data: [RequestData],
        index: 0,
        begins: 0,
        ends: 1,
      }
      console.info('====>SUB_Request_downloadStage_Supplemental_Static_0300 config_multi: ' + JSON.stringify(config));
      try {
        let uploadTask: request.UploadTask = await request.uploadFile(baseContext!, config);
        let failCallback = (taskStates: Array<request.TaskState>) => {
          try {
            uploadTask.offFail();
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_0300 fail TaskState: " + JSON.stringify(taskStates[0]));
            expect(taskStates[0].path !== undefined).assertEqual(true);
            expect(taskStates[0].responseCode !== undefined).assertEqual(true);
            expect(taskStates[0].message !== undefined).assertEqual(true);
            expect(taskStates.length).assertEqual(1);
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_0300 TaskState is correct");
          } catch (err) {
            console.info("====>SUB_Request_downloadStage_Supplemental_Static_0300 err: " + JSON.stringify(err));
          }
        }
        uploadTask.onFail(failCallback)
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_0300 onFail success');
        expect().assertFail();
      }catch (err) {
        console.info('====>SUB_Request_downloadStage_Supplemental_Static_0300 uploadFile err: ' + JSON.stringify(err.code));
        expect(err.code).assertEqual(13400002);
        done();
      }
    });
    
  });
}