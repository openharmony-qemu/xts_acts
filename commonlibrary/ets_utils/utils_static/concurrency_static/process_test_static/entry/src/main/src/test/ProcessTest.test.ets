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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  TestType,
  Level,
  Size
} from '../../../hypium/index';
import Utils from './Util';

export default function ProcessTest(): void {
  describe("ProcessAdditionalTest", (): void => {
    beforeAll((): void => {
    });
    beforeEach((): void => {
    });
    afterEach((): void => {
    });
    afterAll(async (): Promise<void> => { await Utils.msSleep(500); });
    /**
     * @tc.name    ProcessTest0100
     * @tc.number  SUB_STD_PROCESS_TEST_0100
     * @tc.desc    Verify getEnvironmentVar returns the same value in the main thread and EAWorker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('ProcessTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest0100';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let started: boolean = false;
        try {
          worker.start();
          started = true;
          const pathName: string = 'PATH';
          const processManager = new StdProcess.ProcessManager();
          const expected: string = processManager.getEnvironmentVar(pathName);
          const result: string = worker.run<string>(() => {
            const workerProcessManager = new StdProcess.ProcessManager();
            return workerProcessManager.getEnvironmentVar(pathName);
          }).Await();
          expect(result).assertEqual(expected);
        } finally {
          if (started) {
            worker.join().Await();
          }
        }
        console.info(`${TAG} test end`);
        done();
      });


    /**
     * @tc.name    ProcessTest0200
     * @tc.number  SUB_STD_PROCESS_TEST_0200
     * @tc.desc    Verify is64Bit returns the same value in the main thread and EAWorker
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('ProcessTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'ProcessTest0200';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let started: boolean = false;
        try {
          worker.start();
          started = true;
          const expected: boolean = StdProcess.is64Bit();
          const result: boolean = worker.run<boolean>((): boolean => {
            return StdProcess.is64Bit();
          }).Await();
          expect(result).assertEqual(expected);
        } finally {
          if (started) {
            worker.join().Await();
          }
        }
        console.info(`${TAG} test end`);
        done();
      });


  })
}
