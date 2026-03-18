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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { camera } from '@kit.CameraKit';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { getPermission, sleep } from './CameraCommonAPI';
import { MessageEvents, worker } from '@kit.ArkTS';
import { Context } from '@ohos.abilityAccessCtrl';

export default function CameraInWorkerCapture() {
  describe('CameraInWorkerCapture', () => {
    console.info('----------CameraInWorkerCapture begin--------------')
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission()
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
      sleep(1000);
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_0100
     * @tc.name      : SUB_MULTIMEDIA_CAMERA_CAPTURE_0100
     * @tc.desc      : test sub multimedia camera capture example code
     * @tc.url       : https://developer.huawei.com/consumer/cn/doc/harmonyos-guides/camera-shooting-case
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_IN_WORKER_0100', Level.LEVEL1, async (done: Function) => {
      let isdone = false;
      let result = "success";
      let status = true;
      let type = "";
      let context: Context = getContext()
      //前置条件
      let workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/CameraWorker');
      //注册监听Worker返回值
      workerInstance.onmessage = (e: MessageEvents) => {
        console.info('主线程收到结果type:', e.data.type); // 获取Worker返回的type字段
        console.info('主线程收到结果result:', e.data.result); // 获取Worker返回的result字段
        console.info('主线程收到结果status:', e.data.status); // 获取Worker返回的status字段
        console.info('主线程收到结果isdone:', e.data.isdone); // 获取Worker返回的isdone字段
        result = e.data.result;
        isdone = e.data.isdone;
        status = e.data.status;
        type = e.data.type;
        if (!status) {
          workerInstance.terminate();
          expect().assertFail();
        }
        if (type == "initCamera"){
          workerInstance.postMessage({
            type: 'captuePhoto',
            context: context,
            surfaceId: globalThis.surfaceId,
          })
        }
        if (type == "captuePhoto") {
          workerInstance.postMessage({
            type: 'releaseCamera',
            context: context,
            surfaceId: globalThis.surfaceId,
          })
        }
      };
      //测试步骤
      // 通过worker实例向worker线程发送消息初始化相机。
      workerInstance.postMessage({
        type: 'initCamera',
        context: context,
        surfaceId: globalThis.surfaceId,
      })
      let beginTime = Date.now();
      while (!isdone) {
        await sleep(200);
        let tmpTime = Date.now();
        if (tmpTime - beginTime > 15000) {
          beginTime = 0;
          workerInstance.terminate();
          expect().assertFail();
        }
      }

      // 恢复过程
      workerInstance.terminate();
      done()
    })
  })
}