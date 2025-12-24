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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll
} from "../../../hypium/index";
import Utils from './Util.test';
import {quitErrorMsg} from './Util.test';

class MessageObject {
  id: number

  constructor(id: number) {
    this.id = id;
  }
}

export const Sleep = (ms: int) => {
  return new Promise<number>((resolve) => {
    setTimeout(() => {
      resolve(1)
    }, ms)
  });
}

export default function NewEAWorkerTest() {
  describe('NewEAWorkerTest', (): void => {
    afterEach(() => {
      await Utils.msSleep(300);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0100
     * @tc.name getWorkerIdTest001
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest001';
        console.info(`${TAG} test start`);
        let worker = new EAWorker();
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0101
     * @tc.name getWorkerIdTest002
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest002';
        console.info(`${TAG} test start`);
        let worker = new EAWorker('123');
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test start`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0102
     * @tc.name getWorkerIdTest003
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest003';
        console.info(`${TAG} test start`);
        let worker = new EAWorker(() => {
        });
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0103
     * @tc.name getWorkerIdTest004
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest004';
        console.info(`${TAG} test start`);
        let worker = new EAWorker('testName', () => {
        });
        try {
          worker.start();
          let workerId1 = worker.getWorkerId();
          expect(typeof workerId1).assertEqual('int');
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0104
     * @tc.name getWorkerIdTest005
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('getWorkerIdTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest005';
        console.info(`${TAG} test start`);
        let worker1 = new EAWorker();
        let w: boolean = false;
        try {
          worker1.start();
          let result = worker1.run<boolean>((): boolean => {
            let worker2 = new EAWorker();
            worker2.start();
            let workerId1 = worker1.getWorkerId();
            let workerId2 = worker2.getWorkerId();
            worker2.join();
            if (workerId1 != workerId2) {
              w = true;
            }
            return w;
          }).Await();
          expect(w).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker1.quit();
          } catch (error) {
            console.warn(`${TAG} catch quit error: code =>  message => ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0105
     * @tc.name getWorkerIdTest006
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("getWorkerIdTest006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest006';
        console.info(`${TAG} test start`);
        try {
          let workerId1 = EAWorker.main().getWorkerId();
          expect(workerId1).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} catch error: code =>  message => ${error.message}`);
          expect(false).assertFail();
        } finally {
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_CONCURRENCY_EAWorker_New_Test_0106
     * @tc.name getWorkerIdTest007
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('getWorkerIdTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'getWorkerIdTest007';
        console.info(`${TAG} test start`);
        let worker: EAWorker | null = null;
        let workerId: int | undefined = undefined;
        try {
