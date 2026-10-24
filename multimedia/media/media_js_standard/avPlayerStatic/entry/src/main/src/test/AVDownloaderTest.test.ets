'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import media from '@ohos.multimedia.media'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "../../../hypium/index";

const TAG = 'AVDownloaderTest';
const TEST_URL = 'http://1.95.223.57/vod/www/faststart/720p_2m.mp4';

export default function AVDownloaderTest() {
  describe('AVDownloaderTest', () => {
    let avDownloaderManager: media.AVDownloaderManager | undefined = undefined;

    beforeAll(async () => {
      console.info(`${TAG}: beforeAll called`);
      avDownloaderManager = await media.createAVDownloaderManager();
    })

    afterAll(async () => {
      console.info(`${TAG}: afterAll called`);
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.release();
        avDownloaderManager = undefined;
      }
    })

    beforeEach(() => {
      console.info(`${TAG}: beforeEach called`);
    })

    afterEach(() => {
      console.info(`${TAG}: afterEach called`);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_CREATE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_CREATE_FUNCTION_static_0100
     * @tc.desc   Test createAVDownloaderManager returns valid instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_CREATE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: createAVDownloaderManager_001 start`);
      let manager: media.AVDownloaderManager = await media.createAVDownloaderManager();
      expect(manager != null).assertTrue();
      manager.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_CREATE_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_CREATE_FUNCTION_static_0200
     * @tc.desc   Test createAVDownloaderManager instance is not null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_CREATE_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: createAVDownloaderManager_002 start`);
      let manager: media.AVDownloaderManager = await media.createAVDownloaderManager();
      expect(manager == null).assertFalse();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ADDTASK_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ADDTASK_FUNCTION_static_0100
     * @tc.desc   Test addAVDownloadTask with url media source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ADDTASK_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: addAVDownloadTask_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
        console.info(`${TAG}: addAVDownloadTask_001 taskId: ${taskId}`);
        expect(taskId != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ADDTASK_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ADDTASK_FUNCTION_static_0200
     * @tc.desc   Test addAVDownloadTask with directory media source
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ADDTASK_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: addAVDownloadTask_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory('/data/storage/el2/base/files/test.mp4');
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        try {
          let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
          console.info(`${TAG}: addAVDownloadTask_002 taskId: ${taskId}`);
          expect(taskId != null).assertTrue();
        } catch (err) {
          console.error(`${TAG}: addAVDownloadTask_002 failed, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0100
     * @tc.desc   Test createMediaSourceWithDirectory with valid path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_001 start`);
      let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory('/data/storage/el2/base/files/test.mp4');
      console.info(`${TAG}: createMediaSourceWithDirectory_001 result: ${mediaSource}`);
      expect(mediaSource != undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0200
     * @tc.desc   Test createMediaSourceWithDirectory with empty path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_002 start`);
      let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory('');
      console.info(`${TAG}: createMediaSourceWithDirectory_002 result: ${mediaSource}`);
      expect(mediaSource != undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0300
     * @tc.desc   Test createMediaSourceWithDirectory with nonexistent path
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_MEDIASOURCEDIR_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_003 start`);
      try {
        let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory('/nonexistent/path/directory');
        console.info(`${TAG}: createMediaSourceWithDirectory_003 result: ${mediaSource}`);
        done();
      } catch (err) {
        console.error(`${TAG}: createMediaSourceWithDirectory_003 failed, err: ${err}`);
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKS_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKS_FUNCTION_static_0100
     * @tc.desc   Test getDownloadTasks returns array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKS_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getDownloadTasks_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        let tasks: Array<string> = avDownloaderManager!.getDownloadTasks();
        console.info(`${TAG}: getDownloadTasks_001 tasks length: ${tasks.length}`);
        expect(tasks != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKS_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKS_FUNCTION_static_0200
     * @tc.desc   Test getDownloadTasks after adding a task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKS_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getDownloadTasks_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        avDownloaderManager!.addAVDownloadTask(mediaSource!);
        let tasks: Array<string> = avDownloaderManager!.getDownloadTasks();
        console.info(`${TAG}: getDownloadTasks_002 tasks length: ${tasks.length}`);
        expect(tasks.length > 0).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0100
     * @tc.desc   Test getTaskStatus with valid taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskStatus_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
        let status: string = avDownloaderManager!.getTaskStatus(taskId);
        console.info(`${TAG}: getTaskStatus_001 status: ${status}`);
        expect(status != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0200
     * @tc.desc   Test getTaskStatus with empty taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskStatus_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          let status: string = avDownloaderManager!.getTaskStatus('');
          console.info(`${TAG}: getTaskStatus_002 status: ${status}`);
          expect(status == 'error').assertTrue();
        } catch (err) {
          console.info(`${TAG}: getTaskStatus_002 caught error as expected, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0300
     * @tc.desc   Test getTaskStatus with invalid taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKSTATUS_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskStatus_003 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          let status: string = avDownloaderManager!.getTaskStatus('invalid_task_id_12345');
          console.info(`${TAG}: getTaskStatus_003 status: ${status}`);
          expect(status == 'error').assertTrue();
        } catch (err) {
          console.info(`${TAG}: getTaskStatus_003 caught error as expected, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKPROGRESS_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKPROGRESS_FUNCTION_static_0100
     * @tc.desc   Test getTaskProgress with valid taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKPROGRESS_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskProgress_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
        let progress: number = avDownloaderManager!.getTaskProgress(taskId);
        console.info(`${TAG}: getTaskProgress_001 progress: ${progress}`);
        expect(progress != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKPROGRESS_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKPROGRESS_FUNCTION_static_0200
     * @tc.desc   Test getTaskProgress with empty taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTASKPROGRESS_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskProgress_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          let progress: number = avDownloaderManager!.getTaskProgress('');
          console.info(`${TAG}: getTaskProgress_002 progress: ${progress}`);
          expect(progress == -1).assertTrue();
        } catch (err) {
          console.info(`${TAG}: getTaskProgress_002 caught error as expected, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ONSTATUSCHANGE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ONSTATUSCHANGE_FUNCTION_static_0100
     * @tc.desc   Test onStatusChange register callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ONSTATUSCHANGE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: onStatusChange_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.onStatusChange((taskId: string, state: string) => {
          console.info(`${TAG}: onStatusChange callback taskId: ${taskId}, state: ${state}`);
        });
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFSTATUSCHANGE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFSTATUSCHANGE_FUNCTION_static_0100
     * @tc.desc   Test offStatusChange unregister callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFSTATUSCHANGE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: offStatusChange_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        let callback: (taskId: string, state: string) => void = (taskId: string, state: string) => {
          console.info(`${TAG}: offStatusChange_001 callback taskId: ${taskId}, state: ${state}`);
        };
        avDownloaderManager!.onStatusChange(callback);
        avDownloaderManager!.offStatusChange(callback);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFSTATUSCHANGE_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFSTATUSCHANGE_FUNCTION_static_0200
     * @tc.desc   Test offStatusChange without callback parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFSTATUSCHANGE_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: offStatusChange_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.offStatusChange();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ONPROGRESSCHANGE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ONPROGRESSCHANGE_FUNCTION_static_0100
     * @tc.desc   Test onProgressChange register callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ONPROGRESSCHANGE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: onProgressChange_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.onProgressChange((taskId: string, progress: number) => {
          console.info(`${TAG}: onProgressChange callback taskId: ${taskId}, progress: ${progress}`);
        });
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFPROGRESSCHANGE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFPROGRESSCHANGE_FUNCTION_static_0100
     * @tc.desc   Test offProgressChange unregister callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFPROGRESSCHANGE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: offProgressChange_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        let callback: (taskId: string, progress: number) => void = (taskId: string, progress: number) => {
          console.info(`${TAG}: offProgressChange_001 callback taskId: ${taskId}, progress: ${progress}`);
        };
        avDownloaderManager!.onProgressChange(callback);
        avDownloaderManager!.offProgressChange(callback);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFPROGRESSCHANGE_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFPROGRESSCHANGE_FUNCTION_static_0200
     * @tc.desc   Test offProgressChange without callback parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_OFFPROGRESSCHANGE_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: offProgressChange_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.offProgressChange();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0100
     * @tc.desc   Test getTaskCacheDirectory with valid taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskCacheDirectory_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
        let directory: string = avDownloaderManager!.getTaskCacheDirectory(taskId);
        console.info(`${TAG}: getTaskCacheDirectory_001 directory: ${directory}`);
        expect(directory != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0200
     * @tc.desc   Test getTaskCacheDirectory with empty taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskCacheDirectory_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          let directory: string = avDownloaderManager!.getTaskCacheDirectory('');
          console.info(`${TAG}: getTaskCacheDirectory_002 directory: ${directory}`);
          expect(directory == '').assertTrue();
        } catch (error) {
          console.info(`${TAG}: getTaskCacheDirectory_002 catch error: ${error}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0300
     * @tc.desc   Test getTaskCacheDirectory with invalid taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETCACHEDIR_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTaskCacheDirectory_003 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          avDownloaderManager!.getTaskCacheDirectory('10');
          console.info(`${TAG}: getTaskCacheDirectory_003 called with taskId: 10`);
        } catch (err) {
          console.error(`${TAG}: getTaskCacheDirectory_003 failed, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ALLOWCELLULAR_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ALLOWCELLULAR_FUNCTION_static_0100
     * @tc.desc   Test allowsCellularAccess with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ALLOWCELLULAR_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: allowsCellularAccess_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.allowsCellularAccess(true);
        console.info(`${TAG}: allowsCellularAccess_001 set true success`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ALLOWCELLULAR_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ALLOWCELLULAR_FUNCTION_static_0200
     * @tc.desc   Test allowsCellularAccess with false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_ALLOWCELLULAR_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: allowsCellularAccess_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.allowsCellularAccess(false);
        console.info(`${TAG}: allowsCellularAccess_002 set false success`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RELEASE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RELEASE_FUNCTION_static_0100
     * @tc.desc   Test release AVDownloaderManager
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RELEASE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: release_001 start`);
      let manager: media.AVDownloaderManager = await media.createAVDownloaderManager();
      expect(manager != null).assertTrue();
      manager.release();
      console.info(`${TAG}: release_001 success`);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_PAUSE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_PAUSE_FUNCTION_static_0100
     * @tc.desc   Test pauseDownloadTask with valid taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_PAUSE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: pauseDownloadTask_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
        console.info(`${TAG}: pauseDownloadTask_001 taskId: ${taskId}`);
        try {
          avDownloaderManager!.pauseDownloadTask(taskId);
          console.info(`${TAG}: pauseDownloadTask_001 success`);
        } catch (err) {
          console.error(`${TAG}: pauseDownloadTask_001 failed, err: ${err}`);
        }
        expect(taskId != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_PAUSE_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_PAUSE_FUNCTION_static_0200
     * @tc.desc   Test pauseDownloadTask with empty taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_PAUSE_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: pauseDownloadTask_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          avDownloaderManager!.pauseDownloadTask('');
        } catch (err) {
          console.error(`${TAG}: pauseDownloadTask_002 failed, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_REMOVE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_REMOVE_FUNCTION_static_0100
     * @tc.desc   Test removeDownloadTask with valid taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_REMOVE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: removeDownloadTask_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
        console.info(`${TAG}: removeDownloadTask_001 taskId: ${taskId}`);
        try {
          avDownloaderManager!.removeDownloadTask(taskId);
          console.info(`${TAG}: removeDownloadTask_001 success`);
        } catch (err) {
          console.error(`${TAG}: removeDownloadTask_001 failed, err: ${err}`);
        }
        expect(taskId != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_REMOVE_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_REMOVE_FUNCTION_static_0200
     * @tc.desc   Test removeDownloadTask with empty taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_REMOVE_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: removeDownloadTask_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          avDownloaderManager!.removeDownloadTask('');
        } catch (err) {
          console.error(`${TAG}: removeDownloadTask_002 failed, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RESUME_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RESUME_FUNCTION_static_0100
     * @tc.desc   Test resumeDownloadTask after pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RESUME_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: resumeDownloadTask_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined && avDownloaderManager != undefined) {
        let taskId: string = avDownloaderManager!.addAVDownloadTask(mediaSource!);
        console.info(`${TAG}: resumeDownloadTask_001 taskId: ${taskId}`);
        try {
          avDownloaderManager!.pauseDownloadTask(taskId);
          avDownloaderManager!.resumeDownloadTask(taskId);
          console.info(`${TAG}: resumeDownloadTask_001 success`);
        } catch (err) {
          console.error(`${TAG}: resumeDownloadTask_001 failed, err: ${err}`);
        }
        expect(taskId != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RESUME_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RESUME_FUNCTION_static_0200
     * @tc.desc   Test resumeDownloadTask with empty taskId
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_RESUME_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: resumeDownloadTask_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          avDownloaderManager!.resumeDownloadTask('');
        } catch (err) {
          console.error(`${TAG}: resumeDownloadTask_002 failed, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0100
     * @tc.desc   Test setRequestTimeout with valid value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: setRequestTimeout_001 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.setRequestTimeout(30000);
        console.info(`${TAG}: setRequestTimeout_001 success`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0200
     * @tc.desc   Test setRequestTimeout with zero value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: setRequestTimeout_002 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        avDownloaderManager!.setRequestTimeout(0);
        console.info(`${TAG}: setRequestTimeout_002 success`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0300
     * @tc.desc   Test setRequestTimeout with negative value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTIMEOUT_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: setRequestTimeout_003 start`);
      expect(avDownloaderManager != undefined).assertTrue();
      if (avDownloaderManager != undefined) {
        try {
          avDownloaderManager!.setRequestTimeout(-1);
        } catch (err) {
          console.error(`${TAG}: setRequestTimeout_003 failed, err: ${err}`);
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_TASKSTATE_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_TASKSTATE_FUNCTION_static_0100
     * @tc.desc   Test AVDownloadTaskState string values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_TASKSTATE_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: AVDownloadTaskState_001 start`);
      expect('init' === 'init').assertTrue();
      expect('queued' === 'queued').assertTrue();
      expect('running' === 'running').assertTrue();
      expect('completed' === 'completed').assertTrue();
      expect('paused' === 'paused').assertTrue();
      expect('removing' === 'removing').assertTrue();
      expect('error' === 'error').assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTRACKSELECTIONFILTER_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTRACKSELECTIONFILTER_static_0100
     * @tc.desc   Set TrackSelectionFilter with all fields populated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTRACKSELECTIONFILTER_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: setTrackSelectionFilter_001 start`);
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined) {
        let filter: media.TrackSelectionFilter = {
          maxVideoBitrate: 5000000,
          minVideoBitrate: 500000,
          maxVideoFrameRate: 30,
          minVideoFrameRate: 24,
          maxVideoResolution: { width: 1920, height: 1080 },
          minVideoResolution: { width: 640, height: 480 },
          preferredVideoMimeTypes: ['video/mp4', 'video/avc'],
          maxAudioBitrate: 320000,
          minAudioBitrate: 128000,
          maxAudioChannels: 2,
          preferredAudioMimeTypes: ['audio/mp4a-latm'],
          preferredAudioLanguages: ['zh-CN', 'en-US'],
          preferredSubtitleLanguages: ['zh-CN']
        };
        mediaSource.setTrackSelectionFilter(filter);
        console.info(`${TAG}: setTrackSelectionFilter_001 success`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTRACKSELECTIONFILTER_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTRACKSELECTIONFILTER_static_0200
     * @tc.desc   Set TrackSelectionFilter with partial fields populated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETTRACKSELECTIONFILTER_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: setTrackSelectionFilter_002 start`);
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined) {
        let filter: media.TrackSelectionFilter = {
          maxVideoBitrate: 3000000,
          preferredAudioLanguages: ['en-US']
        };
        mediaSource.setTrackSelectionFilter(filter);
        console.info(`${TAG}: setTrackSelectionFilter_002 success`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0100
     * @tc.desc   Get TrackSelectionFilter without setting, expect undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTrackSelectionFilter_001 start`);
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined) {
        let filter: media.TrackSelectionFilter | undefined = mediaSource.getTrackSelectionFilter();
        console.info(`${TAG}: getTrackSelectionFilter_001 filter: ${JSON.stringify(filter)}`);
        expect(filter == undefined).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0200
     * @tc.desc   Set full TrackSelectionFilter then get, verify all fields match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTrackSelectionFilter_002 start`);
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined) {
        let filter: media.TrackSelectionFilter = {
          maxVideoBitrate: 5000000,
          minVideoBitrate: 500000,
          maxVideoFrameRate: 30,
          minVideoFrameRate: 24,
          maxVideoResolution: { width: 1920, height: 1080 },
          minVideoResolution: { width: 640, height: 480 },
          preferredVideoMimeTypes: ['video/mp4', 'video/avc'],
          maxAudioBitrate: 320000,
          minAudioBitrate: 128000,
          maxAudioChannels: 2,
          preferredAudioMimeTypes: ['audio/mp4a-latm'],
          preferredAudioLanguages: ['zh-CN', 'en-US'],
          preferredSubtitleLanguages: ['zh-CN']
        };
        mediaSource.setTrackSelectionFilter(filter);
        let retrieved: media.TrackSelectionFilter | undefined = mediaSource.getTrackSelectionFilter();
        console.info(`${TAG}: getTrackSelectionFilter_002 retrieved: ${JSON.stringify(retrieved)}`);
        expect(retrieved != undefined).assertTrue();
        expect(retrieved!.maxVideoBitrate == 5000000).assertTrue();
        expect(retrieved!.minVideoBitrate == 500000).assertTrue();
        expect(retrieved!.maxVideoFrameRate == 30).assertTrue();
        expect(retrieved!.minVideoFrameRate == 24).assertTrue();
        expect(retrieved!.maxVideoResolution != undefined).assertTrue();
        expect(retrieved!.maxVideoResolution!.width == 1920).assertTrue();
        expect(retrieved!.maxVideoResolution!.height == 1080).assertTrue();
        expect(retrieved!.minVideoResolution != undefined).assertTrue();
        expect(retrieved!.minVideoResolution!.width == 640).assertTrue();
        expect(retrieved!.minVideoResolution!.height == 480).assertTrue();
        expect(retrieved!.preferredVideoMimeTypes != undefined).assertTrue();
        expect(retrieved!.preferredVideoMimeTypes!.length == 2).assertTrue();
        expect(retrieved!.preferredVideoMimeTypes![0] == 'video/mp4').assertTrue();
        expect(retrieved!.preferredVideoMimeTypes![1] == 'video/avc').assertTrue();
        expect(retrieved!.maxAudioBitrate == 320000).assertTrue();
        expect(retrieved!.minAudioBitrate == 128000).assertTrue();
        expect(retrieved!.maxAudioChannels == 2).assertTrue();
        expect(retrieved!.preferredAudioMimeTypes != undefined).assertTrue();
        expect(retrieved!.preferredAudioMimeTypes![0] == 'audio/mp4a-latm').assertTrue();
        expect(retrieved!.preferredAudioLanguages != undefined).assertTrue();
        expect(retrieved!.preferredAudioLanguages!.length == 2).assertTrue();
        expect(retrieved!.preferredAudioLanguages![0] == 'zh-CN').assertTrue();
        expect(retrieved!.preferredAudioLanguages![1] == 'en-US').assertTrue();
        expect(retrieved!.preferredSubtitleLanguages != undefined).assertTrue();
        expect(retrieved!.preferredSubtitleLanguages![0] == 'zh-CN').assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0300
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0300
     * @tc.desc   Set partial TrackSelectionFilter then get, verify set fields match and unset fields are undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_GETTRACKSELECTIONFILTER_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: getTrackSelectionFilter_003 start`);
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined) {
        let filter: media.TrackSelectionFilter = {
          maxVideoBitrate: 3000000,
          preferredAudioLanguages: ['en-US']
        };
        mediaSource.setTrackSelectionFilter(filter);
        let retrieved: media.TrackSelectionFilter | undefined = mediaSource.getTrackSelectionFilter();
        console.info(`${TAG}: getTrackSelectionFilter_003 retrieved: ${JSON.stringify(retrieved)}`);
        expect(retrieved != undefined).assertTrue();
        expect(retrieved!.maxVideoBitrate == 3000000).assertTrue();
        expect(retrieved!.preferredAudioLanguages != undefined).assertTrue();
        expect(retrieved!.preferredAudioLanguages!.length == 1).assertTrue();
        expect(retrieved!.preferredAudioLanguages![0] == 'en-US').assertTrue();
        expect(retrieved!.minVideoBitrate == undefined).assertTrue();
        expect(retrieved!.maxVideoFrameRate == undefined).assertTrue();
        expect(retrieved!.minVideoFrameRate == undefined).assertTrue();
        expect(retrieved!.maxVideoResolution == undefined).assertTrue();
        expect(retrieved!.minVideoResolution == undefined).assertTrue();
        expect(retrieved!.preferredVideoMimeTypes == undefined).assertTrue();
        expect(retrieved!.maxAudioBitrate == undefined).assertTrue();
        expect(retrieved!.minAudioBitrate == undefined).assertTrue();
        expect(retrieved!.maxAudioChannels == undefined).assertTrue();
        expect(retrieved!.preferredAudioMimeTypes == undefined).assertTrue();
        expect(retrieved!.preferredSubtitleLanguages == undefined).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETRETRIEVEKEY_static_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETRETRIEVEKEY_static_0100
     * @tc.desc   Set retrieve key with a valid string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETRETRIEVEKEY_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: setRetrieveKey_001 start`);
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined) {
        mediaSource.setRetrieveKey('myRetrieveKey123');
        console.info(`${TAG}: setRetrieveKey_001 success`);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETRETRIEVEKEY_static_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETRETRIEVEKEY_static_0200
     * @tc.desc   Set retrieve key with an empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVDOWNLOADER_SETRETRIEVEKEY_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info(`${TAG}: setRetrieveKey_002 start`);
      let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
      expect(mediaSource != undefined).assertTrue();
      if (mediaSource != undefined) {
        mediaSource.setRetrieveKey('');
        console.info(`${TAG}: setRetrieveKey_002 success`);
      }
      done();
    })
  })
}
