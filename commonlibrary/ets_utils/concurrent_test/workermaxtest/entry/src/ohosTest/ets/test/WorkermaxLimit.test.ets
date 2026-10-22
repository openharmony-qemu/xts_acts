/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { worker } from '@kit.ArkTS';

const MAX_WORKER_TRY = 32;

function sleep(time: number): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => {
      resolve();
    }, time);
  });
}

export default function workerMaxLimitTest() {
  describe('WorkerMaxLimitTest', () => {

    /**
     * @tc.name   testWorkerMaxLimit0001
     * @tc.number SUB_RUNTIME_MIX_MAX_WORKER_LIMIT_0100
     * @tc.desc   Create workers until the product limit is reached, then release one worker and verify a new
     *            worker can be created again; the limit error code is recorded for real-device arbitration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerMaxLimit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName = 'testWorkerMaxLimit0001';
      const workers: worker.ThreadWorker[] = [];
      let limitCode = 0;
      for (let i = 0; i < MAX_WORKER_TRY; i++) {
        try {
          const instance = new worker.ThreadWorker('../workers/WorkermaxEcho.ets');
          workers.push(instance);
        } catch (err) {
          limitCode = err.code;
          console.info(`${caseName} limit reached at ${i}, code => ${limitCode} message => ${err.message}`);
          break;
        }
      }
      expect(workers.length > 0).assertTrue();

      if (limitCode !== 0) {
        const released = workers.pop();
        if (released !== undefined) {
          released.terminate();
        }
        await sleep(500);
        let recreated = false;
        for (let attempt = 0; attempt < 10 && !recreated; attempt++) {
          try {
            const instance = new worker.ThreadWorker('../workers/WorkermaxEcho.ets');
            recreated = true;
            instance.terminate();
          } catch (err) {
            console.info(`${caseName} recreate attempt ${attempt} failed: code => ${err.code} message => ${err.message}`);
            await sleep(300);
          }
        }
        expect(recreated).assertTrue();
      } else {
        console.info(`${caseName} limit not reached within ${MAX_WORKER_TRY} workers`);
      }

      for (const instance of workers) {
        instance.terminate();
      }
      console.info(`${caseName} test end`);
      done();
    })
  })
}
