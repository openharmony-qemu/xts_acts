'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util';
import {
  taskpoolGetUidForName,
  taskpoolGetEnvironmentVar
} from '../testability/pages/TaskpoolMethodsSupplement';

/**
 * 补充覆盖：taskpool 下 getUidForName/getEnvironmentVar 真实返回值断言，
 * 回调内不 assertFail，汇合后统一断言；不改动原 ProcessSupplementSecondTest。
 */
export default function ProcessTaskpoolUidEnvTest(): void {
  describe('ProcessTaskpoolUidEnvTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
      // 无进程退出/杀进程副作用，无需恢复
    })
     afterAll(async (): Promise<void> => { await Utils.msSleep(500); });


    /**
     * @tc.name    ProcessTaskpoolUidEnvTest0100
     * @tc.number  SUB_PROCESS_TASKPOOL_UID_ENV_TEST_0100
     * @tc.desc    TaskPool getUidForName('root') returns UID 0; assert after Promise.all
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ProcessTaskpoolUidEnvTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessTaskpoolUidEnvTest0100';
      console.info(`${caseName}, test start`);
      const TEST_NAME = 'root';
       const TEST_COUNT: number = 5;
      // taskpool 跨线程回传为 number/Double，不能 as int；汇合后统一断言
      const taskPromises: Promise<number>[] = [];
      for (let i = 0; i < TEST_COUNT; i++) {
        const task = new taskpool.Task(taskpoolGetUidForName, TEST_NAME);
        const index: number = i;
         const promise: Promise<number> = (async (): Promise<number> => {
           const raw = await taskpool.execute(task);
           const value: number = raw as number;
           console.info(`${caseName}, task ${index} completed with uid ${value}`);
           return value;
         })();
        taskPromises.push(promise);
      }
       const uids: number[] = await Promise.all(taskPromises);
       expect(uids.length).assertEqual(TEST_COUNT);
       for (let i = 0; i < uids.length; i++) {
         expect(uids[i]).assertEqual(0);
       }
       console.info(`${caseName}, test end`);
       done();
    });

    /**
     * @tc.name    ProcessTaskpoolUidEnvTest0200
     * @tc.number  SUB_PROCESS_TASKPOOL_UID_ENV_TEST_0200
      * @tc.desc    TaskPool getEnvironmentVar('PATH') matches the main-thread value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('ProcessTaskpoolUidEnvTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      const caseName = 'ProcessTaskpoolUidEnvTest0200';
      console.info(`${caseName}, test start`);
       const TEST_COUNT: number = 5;
       const processManager = new StdProcess.ProcessManager();
       const expected: string = processManager.getEnvironmentVar('PATH');
      const taskPromises: Promise<string>[] = [];
      for (let i = 0; i < TEST_COUNT; i++) {
        const task = new taskpool.Task(taskpoolGetEnvironmentVar, 'PATH');
        const index: number = i;
         const promise: Promise<string> = (async (): Promise<string> => {
           const raw = await taskpool.execute(task);
           const value: string = raw as string;
           console.info(`${caseName}, task ${index} completed with env length ${value.length}`);
           return value;
         })();
        taskPromises.push(promise);
      }
       const envs: string[] = await Promise.all(taskPromises);
       expect(envs.length).assertEqual(TEST_COUNT);
       for (let i = 0; i < envs.length; i++) {
         expect(envs[i]).assertEqual(expected);
       }
       console.info(`${caseName}, test end`);
       done();
    });

  });
}
