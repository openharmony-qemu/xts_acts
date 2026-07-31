/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import connection from '@ohos.net.connection';
import { http } from '@kit.NetworkKit';
import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'AVDownloaderTest';
const TEST_URL = 'https://vod.vmall.com/asset/078eee7b11b89e58aaddeaed5d77fa46/16400054614d016d0618d62e817865f0.mp4';

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

async function getNetId(): Promise<number> {
  try {
    let netHandle = await connection.getDefaultNet();
    return netHandle.netId; // netId为0表示无网络
  } catch (e) {
    console.error(`${TAG}: getDefaultNet failed, err: ${e}`);
    return -1;
  }
}

async function checkConnectivity(url: string, timeoutMs: number = 5000): Promise<boolean> {
  const httpRequest = http.createHttp();
  try {
    const response = await httpRequest.request(url, {
      method: http.RequestMethod.HEAD, // 只请求头部，更轻量
      connectTimeout: timeoutMs,
      readTimeout: timeoutMs,
    });
    console.info(`${TAG}: HEAD: ${JSON.stringify(response)}`);
    return response.responseCode >= 200 && response.responseCode < 400;
  } catch (err) {
    console.info(`${TAG}: HEAD failed: ${JSON.stringify(err)}`);
    return false;
  } finally {
    httpRequest.destroy();
  }
}

async function hasNetwork(): Promise<boolean> {
  const netId = await getNetId();
  const reachable = await checkConnectivity(TEST_URL);
  console.info(`${TAG}: hasNetwork, netId: ${netId}, reachable: ${reachable}`);
  return reachable;
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

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach called`);
      avDownloaderManager = await createAVDownloaderManager();
    })

    afterEach(async () => {
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

    it('createAVDownloaderManager_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: createAVDownloaderManager_002 start`);
      try {
        let manager: media.AVDownloaderManager | null = await media.createAVDownloaderManager();
        console.info(`${TAG}: createAVDownloaderManager_002 manager: ${manager}`);
        expect(manager == null).assertFalse();
        done();
      } catch (err) {
        console.error(`${TAG}: createAVDownloaderManager_002 caught exception, err: ${err}`);
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

    it('createMediaSourceWithDirectory_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_001 start`);
      try {
        let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory('/data/storage/el2/base/files/test.mp4');
        console.info(`${TAG}: createMediaSourceWithDirectory_001 result: ${mediaSource}`);
        expect(mediaSource != undefined).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG}: createMediaSourceWithDirectory_001 failed, err: ${err}`);
        done();
      }
    })

    it('createMediaSourceWithDirectory_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_002 start`);
      try {
        let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory('');
        console.info(`${TAG}: createMediaSourceWithDirectory_002 result: ${mediaSource}`);
        expect(mediaSource != undefined).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG}: createMediaSourceWithDirectory_002 failed, err: ${err}`);
        done();
      }
    })

    it('createMediaSourceWithDirectory_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_003 start`);
      try {
        let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory(null);
        console.info(`${TAG}: createMediaSourceWithDirectory_003 result: ${mediaSource}`);
        expect(mediaSource == undefined).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG}: createMediaSourceWithDirectory_003 failed, err: ${err}`);
        done();
      }
    })

    it('createMediaSourceWithDirectory_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_004 start`);
      try {
        let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory(undefined);
        console.info(`${TAG}: createMediaSourceWithDirectory_004 result: ${mediaSource}`);
        expect(mediaSource == undefined).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG}: createMediaSourceWithDirectory_004 failed, err: ${err}`);
        done();
      }
    })

    it('createMediaSourceWithDirectory_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: createMediaSourceWithDirectory_005 start`);
      try {
        let mediaSource: media.MediaSource | undefined = await media.createMediaSourceWithDirectory('/nonexistent/path/directory');
        console.info(`${TAG}: createMediaSourceWithDirectory_005 result: ${mediaSource}`);
        done();
      } catch (err) {
        console.error(`${TAG}: createMediaSourceWithDirectory_005 failed, err: ${err}`);
        expect((err as BusinessError).code == 5411007).assertTrue();
        done();
      }
    })

    it('addAVDownloadTask_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: addAVDownloadTask_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.addAVDownloadTask(null);
          console.info(`${TAG}: addAVDownloadTask_002 called with null`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: addAVDownloadTask_002 failed, err: ${err}`);
        expect(err != null).assertTrue();
        done();
      }
    })

    it('addAVDownloadTask_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: addAVDownloadTask_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.addAVDownloadTask(undefined);
          console.info(`${TAG}: addAVDownloadTask_002 called with undefined`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: addAVDownloadTask_003 failed, err: ${err}`);
        expect(err != null).assertTrue();
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

    it('getDownloadTasks_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getDownloadTasks_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let tasks: Array<string> = avDownloaderManager!.getDownloadTasks();
        console.info(`${TAG}: getDownloadTasks_002 tasks length: ${tasks.length}`);
        expect(tasks != null).assertTrue();
        done();
      } catch (err) {
        console.error(`${TAG}: getDownloadTasks_002 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('getDownloadTasks_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getDownloadTasks_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          avDownloaderManager.addAVDownloadTask(mediaSource);
          let tasks: Array<string> = avDownloaderManager.getDownloadTasks();
          console.info(`${TAG}: getDownloadTasks_003 tasks length: ${tasks.length}`);
          expect(tasks.length > 0).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getDownloadTasks_003 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('getTaskStatus_001', Level.Level1, async (done: Function) => {
      let hasNet = await hasNetwork();
      console.info(`${TAG}: getTaskStatus_001 start, hasNet: ${hasNet}`);
      if (!hasNet) {
        done();
        return;
      }
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          let status: string = avDownloaderManager.getTaskStatus(taskId);
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

    it('getTaskStatus_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskStatus_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let status: string = avDownloaderManager.getTaskStatus('');
          console.info(`${TAG}: getTaskStatus_002 status: ${status}`);
          expect(status == 'error').assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskStatus_002 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskStatus_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskStatus_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let status: string = avDownloaderManager.getTaskStatus(null);
          console.info(`${TAG}: getTaskStatus_003 status: ${status}`);
          expect(status == 'init').assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskStatus_003 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskStatus_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskStatus_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let status: string = avDownloaderManager.getTaskStatus(undefined);
          console.info(`${TAG}: getTaskStatus_004 status: ${status}`);
          expect(status == 'init').assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskStatus_004 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskStatus_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskStatus_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let status: string = avDownloaderManager.getTaskStatus('invalid_task_id_12345');
          console.info(`${TAG}: getTaskStatus_005 status: ${status}`);
          expect(status == 'error').assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskStatus_005 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskStatus_006', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskStatus_006 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.getTaskStatus('10');
          console.info(`${TAG}: getTaskStatus_006 called with taskId: 10`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskStatus_006 failed, err: ${err}`);
        expect((err as BusinessError).code == 5400108).assertTrue();
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

    it('getTaskProgress_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskProgress_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let progress: number = avDownloaderManager.getTaskProgress('');
          console.info(`${TAG}: getTaskProgress_002 progress: ${progress}`);
          expect(progress == 0).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskProgress_002 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskProgress_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskProgress_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let progress: number = avDownloaderManager.getTaskProgress(null);
          console.info(`${TAG}: getTaskProgress_003 progress: ${progress}`);
          expect(progress == 0).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskProgress_003 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskProgress_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskProgress_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let progress: number = avDownloaderManager.getTaskProgress(undefined);
          console.info(`${TAG}: getTaskProgress_004 progress: ${progress}`);
          expect(progress == 0).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskProgress_004 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskProgress_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskProgress_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.getTaskProgress('10');
          console.info(`${TAG}: getTaskProgress_005 called with taskId: 10`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskProgress_005 failed, err: ${err}`);
        expect((err as BusinessError).code == 5400108).assertTrue();
        done();
      }
    })

    it('onStatusChange_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: onStatusChange_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let statusReceived: boolean = false;
        avDownloaderManager!.onStatusChange((taskId: string, state: string) => {
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

    it('onStatusChange_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: onStatusChange_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.onStatusChange(null);
          console.info(`${TAG}: onStatusChange_002 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: onStatusChange_002 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('onStatusChange_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: onStatusChange_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.onStatusChange(undefined);
          console.info(`${TAG}: onStatusChange_003 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: onStatusChange_003 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offStatusChange_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offStatusChange_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let statusReceived: boolean = false;
          let callback: media.OnAVDownloadTaskStateHandle = (taskId: string, state: media.AVDownloadTaskState) => {
            console.info(`${TAG}: offStatusChange_001 callback taskId: ${taskId}, state: ${state}`);
            statusReceived = true;
          };
          avDownloaderManager.onStatusChange(callback);
          avDownloaderManager.offStatusChange(callback);
          let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
          if (mediaSource != null) {
            avDownloaderManager.addAVDownloadTask(mediaSource);
          }
          await sleep(500);
          console.info(`${TAG}: offStatusChange_001 success, statusReceived should be false: ${statusReceived}`);
          expect(statusReceived == false).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offStatusChange_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offStatusChange_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offStatusChange_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let statusReceived: boolean = false;
          let callback: (taskId: string, state: string) => void = (taskId: string, state: string) => {
            console.info(`${TAG}: offStatusChange_002 callback taskId: ${taskId}, state: ${state}`);
            statusReceived = true;
          };
          avDownloaderManager.onStatusChange(callback);
          avDownloaderManager.offStatusChange(callback);
          let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
          if (mediaSource != null) {
            avDownloaderManager.addAVDownloadTask(mediaSource);
          }
          await sleep(500);
          console.info(`${TAG}: offStatusChange_002 success, statusReceived should be false: ${statusReceived}`);
          expect(statusReceived == false).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offStatusChange_002 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offStatusChange_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offStatusChange_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.offStatusChange(null);
          console.info(`${TAG}: offStatusChange_003 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offStatusChange_003 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offStatusChange_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offStatusChange_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.offStatusChange(undefined);
          console.info(`${TAG}: offStatusChange_004 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offStatusChange_004 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offStatusChange_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offStatusChange_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.offStatusChange();
          console.info(`${TAG}: offStatusChange_005 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offStatusChange_005 failed, err: ${err}`);
        done();
      }
    })

    it('offProgressChange_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offProgressChange_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let progressReceived: boolean = false;
          let callback: media.OnAVDownloadProgressChangeHandle = (taskId: string, progress: number) => {
            console.info(`${TAG}: offProgressChange_001 callback taskId: ${taskId}, progress: ${progress}`);
            progressReceived = true;
          };
          avDownloaderManager.offProgressChange(callback);
          avDownloaderManager.onProgressChange(callback);
          let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
          if (mediaSource != null) {
            avDownloaderManager.addAVDownloadTask(mediaSource);
          }
          await sleep(500);
          console.info(`${TAG}: offProgressChange_001 success, progressReceived should be false: ${progressReceived}`);
          expect(progressReceived == false).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offProgressChange_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offProgressChange_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offProgressChange_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let progressReceived: boolean = false;
          let callback: media.OnAVDownloadProgressChangeHandle = (taskId: string, progress: number) => {
            console.info(`${TAG}: offProgressChange_002 callback taskId: ${taskId}, progress: ${progress}`);
            progressReceived = true;
          };
          avDownloaderManager.onProgressChange(callback);
          avDownloaderManager.offProgressChange(callback);
          let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
          if (mediaSource != null) {
            avDownloaderManager.addAVDownloadTask(mediaSource);
          }
          await sleep(500);
          console.info(`${TAG}: offProgressChange_002 success, progressReceived should be false: ${progressReceived}`);
          expect(progressReceived == false).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offProgressChange_002 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offProgressChange_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offProgressChange_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.offProgressChange(null);
          console.info(`${TAG}: offProgressChange_003 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offProgressChange_003 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offProgressChange_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offProgressChange_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.offProgressChange(undefined);
          console.info(`${TAG}: offProgressChange_004 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offProgressChange_004 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('offProgressChange_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: offProgressChange_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.offProgressChange();
          console.info(`${TAG}: offProgressChange_005 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: offProgressChange_005 failed, err: ${err}`);
        done();
      }
    })

    it('onProgressChange_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: onProgressChange_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.onProgressChange((taskId: string, progress: number) => {
            console.info(`${TAG}: onProgressChange_001 callback taskId: ${taskId}, progress: ${progress}`);
          });
          console.info(`${TAG}: onProgressChange_001 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: onProgressChange_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('onProgressChange_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: onProgressChange_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.onProgressChange(null);
          console.info(`${TAG}: onProgressChange_002 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: onProgressChange_002 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('onProgressChange_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: onProgressChange_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.onProgressChange(undefined);
          console.info(`${TAG}: onProgressChange_003 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: onProgressChange_003 failed, err: ${err}`);
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

    it('getTaskCacheDirectory_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskCacheDirectory_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let directory: string = avDownloaderManager.getTaskCacheDirectory('');
          console.info(`${TAG}: getTaskCacheDirectory_002 directory: ${directory}`);
          expect(directory == '').assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskCacheDirectory_002 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskCacheDirectory_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskCacheDirectory_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let directory: string | undefined = avDownloaderManager.getTaskCacheDirectory(null);
          console.info(`${TAG}: getTaskCacheDirectory_003 directory: ${directory}`);
          expect(directory == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskCacheDirectory_003 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskCacheDirectory_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskCacheDirectory_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let directory: string | undefined = avDownloaderManager.getTaskCacheDirectory(undefined);
          console.info(`${TAG}: getTaskCacheDirectory_004 directory: ${directory}`);
          expect(directory == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskCacheDirectory_004 failed, err: ${err}`);
        done();
      }
    })

    it('getTaskCacheDirectory_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: getTaskCacheDirectory_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.getTaskCacheDirectory('10');
          console.info(`${TAG}: getTaskCacheDirectory_005 called with taskId: 10`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: getTaskCacheDirectory_005 failed, err: ${err}`);
        expect((err as BusinessError).code == 5400108).assertTrue();
        done();
      }
    })

    it('allowsCellularAccess_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: allowsCellularAccess_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.allowsCellularAccess(true);
          console.info(`${TAG}: allowsCellularAccess_001 set true success`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: allowsCellularAccess_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('allowsCellularAccess_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: allowsCellularAccess_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.allowsCellularAccess(false);
          console.info(`${TAG}: allowsCellularAccess_002 set false success`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: allowsCellularAccess_002 failed, err: ${err}`);
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

    it('pauseDownloadTask_001', Level.Level1, async (done: Function) => {
      let hasNet = await hasNetwork();
      console.info(`${TAG}: pauseDownloadTask_001 start, hasNet: ${hasNet}`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          await sleep(1000);
          console.info(`${TAG}: pauseDownloadTask_001 taskId: ${taskId}`);
          avDownloaderManager.pauseDownloadTask(taskId);
          console.info(`${TAG}: pauseDownloadTask_001 success`);
          if (hasNet) {
            expect(taskId != null).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      } catch (err) {
        console.error(`${TAG}: pauseDownloadTask_001 failed, err: ${err}`);
        if (hasNet) {
          expect().assertFail();
        } else {
          expect(true).assertTrue();
        }
        done();
      }
    })

    it('pauseDownloadTask_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: pauseDownloadTask_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.pauseDownloadTask('');
          console.info(`${TAG}: pauseDownloadTask_002 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: pauseDownloadTask_002 failed, err: ${err}`);
        done();
      }
    })

    it('pauseDownloadTask_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: pauseDownloadTask_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.pauseDownloadTask(null);
          console.info(`${TAG}: pauseDownloadTask_003 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: pauseDownloadTask_003 failed, err: ${err}`);
        done();
      }
    })

    it('pauseDownloadTask_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: pauseDownloadTask_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.pauseDownloadTask(undefined);
          console.info(`${TAG}: pauseDownloadTask_004 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: pauseDownloadTask_004 failed, err: ${err}`);
        done();
      }
    })

    it('pauseDownloadTask_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: pauseDownloadTask_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.pauseDownloadTask();
          console.info(`${TAG}: pauseDownloadTask_005 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: pauseDownloadTask_005 failed, err: ${err}`);
        done();
      }
    })

    it('pauseDownloadTask_006', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: pauseDownloadTask_006 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: pauseDownloadTask_006 taskId: ${taskId}`);
          await sleep(1000);
          avDownloaderManager.pauseDownloadTask(taskId);
          console.info(`${TAG}: pauseDownloadTask_006 success`);
          avDownloaderManager.pauseDownloadTask(taskId);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: pauseDownloadTask_006 failed, err: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code == 5400102).assertTrue();
        done();
      }
    })

    it('pauseDownloadTask_007', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: pauseDownloadTask_007 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: pauseDownloadTask_007 taskId: ${taskId}`);
          await sleep(1000);
          avDownloaderManager.pauseDownloadTask("999999");
        }
      } catch (err) {
        console.error(`${TAG}: pauseDownloadTask_007 failed, err: ${JSON.stringify(err)}`);
        expect((err as BusinessError).code == 5400108).assertTrue();
        done();
      }
    })

    it('removeDownloadTask_001', Level.Level1, async (done: Function) => {
      let hasNet = await hasNetwork();
      console.info(`${TAG}: removeDownloadTask_001 start, hasNet: ${hasNet}`);
      if (!hasNet) {
        done();
        return;
      }
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: removeDownloadTask_001 taskId: ${taskId}`);
          await sleep(1000);
          avDownloaderManager.removeDownloadTask(taskId);
          console.info(`${TAG}: removeDownloadTask_001 success`);
          expect(taskId != null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: removeDownloadTask_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('removeDownloadTask_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: removeDownloadTask_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.removeDownloadTask('');
          console.info(`${TAG}: removeDownloadTask_002 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: removeDownloadTask_002 failed, err: ${err}`);
        done();
      }
    })

    it('removeDownloadTask_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: removeDownloadTask_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.removeDownloadTask(null);
          console.info(`${TAG}: removeDownloadTask_003 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: removeDownloadTask_003 failed, err: ${err}`);
        done();
      }
    })

    it('removeDownloadTask_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: removeDownloadTask_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.removeDownloadTask(undefined);
          console.info(`${TAG}: removeDownloadTask_004 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: removeDownloadTask_004 failed, err: ${err}`);
        done();
      }
    })

    it('removeDownloadTask_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: removeDownloadTask_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.removeDownloadTask();
          console.info(`${TAG}: removeDownloadTask_005 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: removeDownloadTask_005 failed, err: ${err}`);
        done();
      }
    })

    it('removeDownloadTask_006', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: removeDownloadTask_006 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          avDownloaderManager.removeDownloadTask('10');
          console.info(`${TAG}: removeDownloadTask_006 called with taskId: 10`);
        }
        done();
      } catch (err) {
        console.error(`${TAG}: removeDownloadTask_006 failed, err: ${err}`);
        expect((err as BusinessError).code == 5400108).assertTrue();
        done();
      }
    })

    it('resumeDownloadTask_001', Level.Level1, async (done: Function) => {
      let hasNet = await hasNetwork();
      console.info(`${TAG}: resumeDownloadTask_001 start, hasNet: ${hasNet}`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: resumeDownloadTask_001 taskId: ${taskId}`);
          await sleep(1000);
          avDownloaderManager.pauseDownloadTask(taskId);
          avDownloaderManager.resumeDownloadTask(taskId);
          console.info(`${TAG}: resumeDownloadTask_001 success`);
          if (hasNet) {
            expect(taskId != null).assertTrue();
          } else {
            expect().assertFail();
          }
        }
        done();
      } catch (err) {
        console.error(`${TAG}: resumeDownloadTask_001 failed, err: ${err}`);
        if (hasNet) {
          expect().assertFail();
        } else {
          expect(true).assertTrue();
        }
        done();
      }
    })

    it('resumeDownloadTask_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: resumeDownloadTask_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.resumeDownloadTask('');
          console.info(`${TAG}: resumeDownloadTask_002 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: resumeDownloadTask_002 failed, err: ${err}`);
        done();
      }
    })

    it('resumeDownloadTask_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: resumeDownloadTask_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.resumeDownloadTask(null);
          console.info(`${TAG}: resumeDownloadTask_003 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: resumeDownloadTask_003 failed, err: ${err}`);
        done();
      }
    })

    it('resumeDownloadTask_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: resumeDownloadTask_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.resumeDownloadTask(undefined);
          console.info(`${TAG}: resumeDownloadTask_004 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: resumeDownloadTask_004 failed, err: ${err}`);
        done();
      }
    })

    it('resumeDownloadTask_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: resumeDownloadTask_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.resumeDownloadTask();
          console.info(`${TAG}: resumeDownloadTask_005 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: resumeDownloadTask_005 failed, err: ${err}`);
        done();
      }
    })

    it('resumeDownloadTask_006', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: resumeDownloadTask_006 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: resumeDownloadTask_006 taskId: ${taskId}`);
          await sleep(1000);
          avDownloaderManager.resumeDownloadTask(taskId);
          console.info(`${TAG}: resumeDownloadTask_006 success`);
          expect(taskId != null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: resumeDownloadTask_006 failed, err: ${err}`);
        expect((err as BusinessError).code == 5400102).assertTrue();
        done();
      }
    })

    it('resumeDownloadTask_007', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: resumeDownloadTask_007 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        let mediaSource: media.MediaSource | undefined = media.createMediaSourceWithUrl(TEST_URL);
        expect(mediaSource != null).assertTrue();
        if (mediaSource != null && avDownloaderManager != null) {
          let taskId: string = avDownloaderManager.addAVDownloadTask(mediaSource);
          console.info(`${TAG}: resumeDownloadTask_007 taskId: ${taskId}`);
          await sleep(1000);
          avDownloaderManager.resumeDownloadTask("999999");
        }
        done();
      } catch (err) {
        console.error(`${TAG}: resumeDownloadTask_007 failed, err: ${err}`);
        expect((err as BusinessError).code == 5400108).assertTrue();
        done();
      }
    })

    it('setRequestTimeout_001', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: setRequestTimeout_001 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.setRequestTimeout(30000);
          console.info(`${TAG}: setRequestTimeout_001 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: setRequestTimeout_001 failed, err: ${err}`);
        expect().assertFail();
        done();
      }
    })

    it('setRequestTimeout_002', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: setRequestTimeout_002 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.setRequestTimeout(0);
          console.info(`${TAG}: setRequestTimeout_002 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: setRequestTimeout_002 failed, err: ${err}`);
        done();
      }
    })

    it('setRequestTimeout_003', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: setRequestTimeout_003 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.setRequestTimeout(-1);
          console.info(`${TAG}: setRequestTimeout_003 result: ${result}`);
          expect(result == undefined).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: setRequestTimeout_003 failed, err: ${err}`);
        done();
      }
    })

    it('setRequestTimeout_004', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: setRequestTimeout_004 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.setRequestTimeout(null);
          console.info(`${TAG}: setRequestTimeout_004 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: setRequestTimeout_004 failed, err: ${err}`);
        done();
      }
    })

    it('setRequestTimeout_005', Level.Level1, async (done: Function) => {
      console.info(`${TAG}: setRequestTimeout_005 start`);
      try {
        expect(avDownloaderManager != null).assertTrue();
        if (avDownloaderManager != null) {
          let result = avDownloaderManager.setRequestTimeout(undefined);
          console.info(`${TAG}: setRequestTimeout_005 result: ${result}`);
          expect(result == null).assertTrue();
        }
        done();
      } catch (err) {
        console.error(`${TAG}: setRequestTimeout_005 failed, err: ${err}`);
        done();
      }
    })
  })
}