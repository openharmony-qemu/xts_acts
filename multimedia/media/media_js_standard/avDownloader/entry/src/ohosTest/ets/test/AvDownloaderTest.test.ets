/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'AVDownloaderTest';
const TEST_URL = 'https://xxx/xx.mp4';

let avDownloaderManager: media.AVDownloaderManager | null = null;

function sleep(ms: number): Promise<void> {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function createAVDownloaderManager(): Promise<media.AVDownloaderManager | null> {
  try {
    let manager: media.AVDownloaderManager = await media.createAVDownloaderManager();
    console.info(`${TAG}: createAVDownloaderManager success`);
    return manager;
  } catch (err) {
    console.error(`${TAG}: createAVDownloaderManager failed, err: ${err}`);
    return null;
  }
}

export default function AvDownloaderTest() {
  describe('AVDownloaderTest', () => {
    beforeAll(async () => {
      console.info(`${TAG}: beforeAll called`);
      avDownloaderManager = await createAVDownloaderManager();
    })

    afterAll(async () => {
      console.info(`${TAG}: afterAll called`);
      if (avDownloaderManager != null) {
        avDownloaderManager.release();
        avDownloaderManager = null;
      }
    })

    beforeEach(() => {
      console.info(`${TAG}: beforeEach called`);
    })

    afterEach(() => {
      console.info(`${TAG}: afterEach called`);
    })

    it('createAVDownloaderManager_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: createAVDownloaderManager_001 start`);
      try {
        let manager: media.AVDownloaderManager | null = await media.createAVDownloaderManager();
        expect(manager != null).assertTrue();
        console.info(`${TAG}: createAVDownloaderManager_001 success`);
        if (manager != null) {
          manager.release();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: createAVDownloaderManager_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('addAVDownloadTask_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: addAVDownloadTask_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: addAVDownloadTask_001 taskId: ${taskId}`);
          expect(taskId != null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: addAVDownloadTask_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('getDownloadTasks_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getDownloadTasks_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let tasks: Array<string> = avDownloaderManager!.getDownloadTasks();
        console.info(`${TAG}: getDownloadTasks_001 tasks length: ${tasks.length}`);
        expect(tasks != null).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG}: getDownloadTasks_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('getTaskStatus_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskStatus_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          let status: media.AVDownloadTaskState = avDownloaderManager.getTaskStatus(taskId);
          console.info(`${TAG}: getTaskStatus_001 status: ${status}`);
          expect(status != null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskStatus_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('getTaskProgress_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskProgress_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          let progress: number = avDownloaderManager.getTaskProgress(taskId);
          console.info(`${TAG}: getTaskProgress_001 progress: ${progress}`);
          expect(progress != null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskProgress_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('onStatusChange_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: onStatusChange_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let statusReceived: boolean = false;
        avDownloaderManager!.onStatusChange((taskId: string, state: media.AVDownloadTaskState) => {
          console.info(`${TAG}: onStatusChange callback taskId: ${taskId}, state: ${state}`);
          statusReceived = true;
        });
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: onStatusChange_001 added taskId: ${taskId}`);
          expect(taskId != null).assertTrue();
        }
        await sleep(1000);
        console.info(`${TAG}: onStatusChange_001 success, statusReceived: ${statusReceived}`);
        expect(statusReceived).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG}: onStatusChange_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('getTaskCacheDirectory_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskCacheDirectory_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          let directory: string = avDownloaderManager.getTaskCacheDirectory(taskId);
          console.info(`${TAG}: getTaskCacheDirectory_001 directory: ${directory}`);
          expect(directory != null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskCacheDirectory_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('release_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: release_001 start`);
      try {
        let manager: media.AVDownloaderManager | null = await createAVDownloaderManager();
        expect(manager != null).assertTrue();
        if (manager != null) {
          manager.release();
        }
        console.info(`${TAG}: release_001 success`);
        done();
      } catch (err) {
        console.error(`${TAG}: release_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })
  })
}