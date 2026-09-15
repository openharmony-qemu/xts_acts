/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, expect, it, TestType, Size, Level} from '@ohos/hypium'
import worker, { ErrorEvent, MessageEvents, ThreadWorkerPriority } from '@ohos.worker'

const asyncSleep: Function = (time: number): Promise<Object> => {
  return new Promise(resolve => setTimeout(resolve, time));
}

const expectAssertEqual: Function = (actualValue: number | string, expectValue: number | string): void => {
  try {
    expect(actualValue).assertEqual(expectValue);
  } catch (error) {
    console.info(`expectAssertEqual catch error: ${error}`);
  }
}

const expectAssertTrue: Function = (actualValue: boolean): void => {
  try {
    expect(actualValue).assertTrue();
  } catch (error) {
    console.info(`expectAssertTrue catch error: ${error}`);
  }
}

const expectAssertContain: Function = (actualValue: string, expectValue: string): void => {
  try {
    expect(actualValue).assertContain(expectValue);
  } catch (error) {
    console.info(`expectAssertContain catch error: ${error}`);
  }
}

type ActualValueType = number | Date | string | RegExp | Array<string | number> | Map<string, string> | Set<number> | Object | ArrayBuffer | Int8Array;
const expectAssertInstanceOf: Function = (actualValue: ActualValueType, expectValue: string): void => {
  try {
    expect(actualValue).assertInstanceOf(expectValue);
  } catch (error) {
    console.info(`expectAssertInstanceOf catch error: ${error}`);
  }
}

let sleep = async (delay: number = 1000): Promise<void> => {
  return new Promise((resolve, _) => {
    setTimeout(async () => {
      resolve();
    }, delay);
  });
};

export default function workerPriTest() {
  describe('ActsWorkerPriTest', () => {

    class TestObj {
      private message: string = 'this is a message from TestObj';

      public getMessage(): string {
        return this.message;
      }

      public getMessageWithInput(str: string): string {
        return `${this.message} with input: ${str}`;
      }
    }


    /**
     * @tc.name   testWorkerError10100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0001
     * @tc.desc   test worker total amount limited with ThreadWorkerPriority.HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError10100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError10100';
      console.info(`${caseName} test start`);
      await sleep(4000);
      try {
        const workerInstancesONE: worker.ThreadWorker[] = [];
        for (let i: number = 0; i < 64; i++) {
          workerInstancesONE.push(new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH }));
        }
        try {
          const workerInstancesONE_9: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
          workerInstancesONE_9.terminate();
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200003);
          expectAssertContain(error.message, 'Worker initialization failed');
          console.info(`${caseName}: catch error: done`);
        }
        for (let i: number = 0; i < workerInstancesONE.length; i++) {
          workerInstancesONE[i].terminate();
        }
        console.info(`${caseName}: terminate: done`);
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    })

    /**
     * @tc.name   testWorkerError10200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0002
     * @tc.desc   test worker error with type parameter error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10200';
      console.info(`${caseName} test start`);
      await sleep(4000);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          type: 'module', name: 'first worker in Stage model', shared: false , priority: ThreadWorkerPriority.IDLE
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the type must be ' +
            'classic, unsupport others now.');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0003
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          type: 'classic', name: 'first worker in Stage model', shared: false , priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
          );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0004
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          name: 'first worker in Stage model', shared: false , priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0005
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          shared: false , priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0006
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          priority: undefined
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError10700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0007
     * @tc.desc   test worker error with ThreadWorkerPriority parameter undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', {
          priority: undefined , type: 'classic', name: 'first worker in Stage model', shared: false
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 401);
        expectAssertContain(error.message, 'Parameter error. The input parameters are invalid, the priority value is invalid'
        );
        done();
      }
      console.info(`${caseName} test end`);
    });



    /**
     * @tc.name   testWorkerError10800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0008
     * @tc.desc   test worker should not have error with random parameter sequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          priority: ThreadWorkerPriority.IDLE, type: 'classic', name: 'first worker in Stage model', shared: false
        });
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });



    /**
     * @tc.name   testWorkerError10900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0009
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError10900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError10900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.postMessage({
          name: 'workerInstance',
          type: 'worker.ThreadWorker'
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0010
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.postMessage({
          name: 'workerInstance',
          type: 'worker.ThreadWorker'
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0011
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.postMessage({
          name: 'workerInstance',
          type: 'worker.ThreadWorker'
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0012
     * @tc.desc   test worker EC 10200004 with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.postMessage({
          name: 'workerInstance',
          type: 'worker.ThreadWorker'
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0013
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const func: Function = (): string => {
          return 'func';
        }
        try {
          workerInstance.postMessage(func);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0014
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const func: Function = (): string => {
          return 'func';
        }
        try {
          workerInstance.postMessage(func);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0015
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const func: Function = (): string => {
          return 'func';
        }
        try {
          workerInstance.postMessage(func);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0016
     * @tc.desc   test worker EC 10200006 with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        const func: Function = (): string => {
          return 'func';
        }
        try {
          workerInstance.postMessage(func);
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          expectAssertEqual(error.code, 10200006);
          expectAssertContain(error.message, 'An exception occurred during serialization');
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0017
     * @tc.desc   test worker EC 10200004- on interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.on('workerInstance_on', () => {
          console.info(`${caseName}: workerInstance_on listener callback`);
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0018
     * @tc.desc   test worker EC 10200004- once interface with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.once('workerInstance_once', () => {
          console.info(`${caseName}: workerInstance_once listener callback`);
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError11900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0019
     * @tc.desc   test worker EC 10200004- off interface with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError11900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError11900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.on('workerInstance_on', () => {
          console.info(`${caseName}: workerInstance_on listener callback`);
        });
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.off('workerInstance_on');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0020
     * @tc.desc   test worker EC 10200004- registerGlobalCallObject interface with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError12000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError12000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        let registerObj: TestObj = new TestObj();
        workerInstance.registerGlobalCallObject('myObj', registerObj);
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0021
     * @tc.desc   test worker EC 10200004- unregisterGlobalCallObject interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError12100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError12100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        let registerObj: TestObj = new TestObj();
        workerInstance.registerGlobalCallObject('myObj', registerObj);
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.unregisterGlobalCallObject('myObj');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0022
     * @tc.desc   test worker EC 10200004- terminate interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0023
     * @tc.desc   test worker EC 10200004- addEventListener interface with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.addEventListener('workerInstance_addEventListener', () => {
          console.info(`${caseName}: workerInstance_addEventListener listener callback`);
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0024
     * @tc.desc   test worker EC 10200004- removeEventListener interface with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.addEventListener('workerInstance_addEventListener', () => {
          console.info(`${caseName}: workerInstance_addEventListener listener callback`);
        });
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.removeEventListener('workerInstance_addEventListener');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0025
     * @tc.desc   test worker EC 10200004- dispatchEvent interface with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.dispatchEvent({
          type: 'workerInstance_1_addEventListener', timeStamp: 0
        });
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0026
     * @tc.desc   test worker EC 10200004- removeAllListener interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.addEventListener('workerInstance_addEventListener', () => {
          console.info(`${caseName}: workerInstance_addEventListener listener callback`);
        });
        workerInstance.addEventListener('workerInstance_addEventListener2', () => {
          console.info(`${caseName}: workerInstance_addEventListener2 listener callback`);
        });
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        workerInstance.removeAllListener();
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200004);
        expectAssertContain(error.message, 'Worker instance is not running');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0027
     * @tc.desc   test worker EC 10200006- onmessage interface with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_010.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200006);
          expectAssertContain(e.data.message, 'An exception occurred during serialization');
        }
        workerInstance.postMessage('message');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0028
     * @tc.desc   test worker EC 10200006- onmessage interface with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_012.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200006);
          expectAssertContain(e.data.message, 'An exception occurred during serialization');
        }

        class TestFuncObj {
          public getFunction(): Function {
            const add = (num1: number, num2: number): number => {
              return num1 + num2;
            }
            return add;
          }
        }

        const testObj: TestFuncObj = new TestFuncObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.postMessage('start');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }

      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError12900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0029
     * @tc.desc   test worker EC 10200019 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError12900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError12900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_013.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200019);
          expectAssertContain(e.data.message, 'The globalCallObject is not registered');
        }
        const testObj: TestObj = new TestObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.unregisterGlobalCallObject('myObj');
        workerInstance.postMessage('start');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError13000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0030
     * @tc.desc   test worker EC 10200020 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_014.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          flag = true;
          expectAssertEqual(e.data.code, 10200020);
          expect(e.data.message)
            .assertContain('The method to be called is not callable or is an async method or a generator');
        }

        class TestAsyncFuncObj {
          public async testAsyncFunc(): Promise<Object> {
            return new Promise(resolve => setTimeout(resolve, 1000));
          }
        }

        const testObj: TestAsyncFuncObj = new TestAsyncFuncObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.postMessage('TestAsyncFuncObj');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError13100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0031
     * @tc.desc   test worker EC 10200021 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_015.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate: boolean = false;
        let flag: boolean = false;
        workerInstance.onexit = (): void => {
          console.info(`${caseName}: workerInstance.onexit`);
          isTerminate = true;
        }
        workerInstance.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance.onmessage: ${JSON.stringify(e)}`);
          if (e.data == 'host thread executes 2000ms') {
            let t = Date.now();
            while (Date.now() - t < 2000) {}
          } else {
            flag = true;
            expectAssertEqual(e.data.code, 10200021);
            expectAssertContain(e.data.message, 'Waiting for a global call timed out');
          }
        }

        class TestTimeoutFuncObj {
          public testTimeoutFunc(): number {
            let sum: number = 0;
            for (let i: number = 0; i < 1000000; i++) {
              sum += i;
            }
            return sum;
          }
        }

        const testObj: TestTimeoutFuncObj = new TestTimeoutFuncObj();
        workerInstance.registerGlobalCallObject('myObj', testObj);
        workerInstance.postMessage('start');
        while (!flag) {
          await asyncSleep(100);
        }
        workerInstance.terminate();
        while (!isTerminate) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError13200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0032
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        expect().assertFail();
        workerInstance.terminate();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200007);
        expectAssertContain(error.message, 'The worker file path is invalid');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError13300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0033
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        expect().assertFail();
        workerInstance.terminate();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200007);
        expectAssertContain(error.message, 'The worker file path is invalid');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError13400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0034
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority LOW
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.LOW });
        expect().assertFail();
        workerInstance.terminate();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200007);
        expectAssertContain(error.message, 'The worker file path is invalid');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerError13500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0035
     * @tc.desc   test threadWorker constructor EC 10200007 with ThreadWorkerPriority IDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerError13500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerError13500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        expect().assertFail();
        workerInstance.terminate();
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expectAssertEqual(error.code, 10200007);
        expectAssertContain(error.message, 'The worker file path is invalid');
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerConstructor1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0036
     * @tc.desc   test threadWorker constructor MEDIUM + IDLE communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerInstance');
          workerInstance_2.postMessage(e.data);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello workerInstance');
        }
        workerInstance_1.postMessage('workerInstance');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testWorkerConstructor1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0037
     * @tc.desc   test threadWorker constructor LOW + HIGH communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerInstance');
          workerInstance_2.postMessage(e.data);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello workerInstance');
        }
        workerInstance_1.postMessage('workerInstance');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
        console.info(`${caseName} test end`);
      }
    });

    /**
     * @tc.name   testWorkerConstructor1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0038
     * @tc.desc   test threadWorker constructor HIGH + MEDIUM communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_1', priority: ThreadWorkerPriority.HIGH
        });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerInstance_1');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_2', priority: ThreadWorkerPriority.MEDIUM
        });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'workerInstance_2');
        }
        workerInstance_1.postMessage('getWorkerInstance_1Name');
        workerInstance_2.postMessage('getWorkerInstance_2Name');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerConstructor1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0039
     * @tc.desc   test threadWorker constructor LOW + IDLE communication together
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerConstructor1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_1', priority: ThreadWorkerPriority.LOW
        });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'workerInstance_1');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_2', priority: ThreadWorkerPriority.IDLE
        });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'workerInstance_2');
        }
        workerInstance_1.postMessage('getWorkerInstance_1Name');
        workerInstance_2.postMessage('getWorkerInstance_2Name');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0040
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'string message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello string message');
        }
        workerInstance_1.postMessage('string message');
        workerInstance_2.postMessage('string message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0041
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 'string message');
          workerInstance_2.postMessage('string message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 'Hello string message');
        }
        workerInstance_1.postMessage('string message');
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0042
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 100001);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 100002);
        }
        workerInstance_1.postMessage(100001);
        workerInstance_2.postMessage(100002);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0043
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data, 100001);
          workerInstance_2.postMessage(100002);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data, 100002);
        }
        workerInstance_1.postMessage(100001);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0044
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        const date1: Date = new Date();
        workerInstance_1.postMessage(date1);
        const date2: Date = new Date();
        workerInstance_2.postMessage(date2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0045
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Date');
          const date2: Date = new Date();
          workerInstance_2.postMessage(date2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Date');
        }
        const date1: Date = new Date();
        workerInstance_1.postMessage(date1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1700
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0046
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1700';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        const re1: RegExp = new RegExp('worker1');
        workerInstance_1.postMessage(re1);
        const re2: RegExp = new RegExp('worker2');
        workerInstance_2.postMessage(re2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1800
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0047
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1800';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
          const re2: RegExp = new RegExp('worker2');
          workerInstance_2.postMessage(re2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'RegExp');
        }
        const re1: RegExp = new RegExp('worker1');
        workerInstance_1.postMessage(re1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage1900
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0048
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage1900';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        const arr1: Array<number> = new Array(1, 2, 3);
        workerInstance_1.postMessage(arr1);
        const arr2: Array<number> = Array(4, 5, 6);
        workerInstance_2.postMessage(arr2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage2000
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0049
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2000';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Array');
          const arr2: Array<number> = Array(4, 5, 6);
          workerInstance_2.postMessage(arr2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Array');
        }
        const arr1: Array<number> = new Array(1, 2, 3);
        workerInstance_1.postMessage(arr1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage2100
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0050
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2100';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.IDLE });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        const map1: Map<string, string> = new Map([['name', 'worker1']]);
        workerInstance_1.postMessage(map1);
        const map2: Map<string, string> = new Map([['name', 'worker2']]);
        workerInstance_2.postMessage(map2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage2200
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0051
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2200';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.HIGH });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Map');
          const map2: Map<string, string> = new Map([['name', 'worker2']]);
          workerInstance_2.postMessage(map2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Map');
        }
        const map1: Map<string, string> = new Map([['name', 'worker1']]);
        workerInstance_1.postMessage(map1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage2300
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0052
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2300';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        const set1: Set<number> = new Set([1, 2, 3]);
        workerInstance_1.postMessage(set1);
        const set2: Set<number> = new Set([4, 5, 6]);
        workerInstance_2.postMessage(set2);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage2400
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0053
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2400';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.MEDIUM });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_1 = true;
          expectAssertInstanceOf(e.data, 'Set');
          const set2: Set<number> = new Set([4, 5, 6]);
          workerInstance_2.postMessage(set2);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)} type => ${JSON.stringify(typeof e.data)}`);
          flag_2 = true;
          expectAssertInstanceOf(e.data, 'Set');
        }
        const set1: Set<number> = new Set([1, 2, 3]);
        workerInstance_1.postMessage(set1);
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage2500
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0054
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2500';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data.name, 'workerInstance_1');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_2.onmessage: ${JSON.stringify(e)}`);
          flag_2 = true;
          expectAssertEqual(e.data.name, 'workerInstance_2');
        }
        workerInstance_1.postMessage({
          name: 'workerInstance_1',
          type: 'worker.ThreadWorker'
        });
        workerInstance_2.postMessage({
          name: 'workerInstance_2',
          type: 'worker.ThreadWorker'
        });
        while (!(flag_1 && flag_2)) {
          await asyncSleep(100);
        }
        workerInstance_1.terminate();
        workerInstance_2.terminate();
        while (!(isTerminate_1 && isTerminate_2)) {
          await asyncSleep(100);
        }
        done();
      } catch (error) {
        console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
        done();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.name   testWorkerPostMessage2600
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0055
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWorkerPostMessage2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage2600';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
        let isTerminate_1: boolean = false;
        let flag_1: boolean = false;
        workerInstance_1.onexit = (): void => {
          console.info(`${caseName}: workerInstance_1.onexit`);
          isTerminate_1 = true;
        }
        workerInstance_1.onmessage = (e: MessageEvents): void => {
          console.info(`${caseName}: workerInstance_1.onmessage: ${JSON.stringify(e)}`);
          flag_1 = true;
          expectAssertEqual(e.data.name, 'workerInstance_1');
          workerInstance_2.postMessage({
            name: 'workerInstance_2',
            type: 'worker.ThreadWorker'
          });
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts', { priority: ThreadWorkerPriority.LOW });
        let isTerminate_2: boolean = false;
        let flag_2: boolean = false;
        workerInstance_2.onexit = (): void => {
          console.info(`${caseName}: workerInstance_2.onexit`);
          isTerminate_2 = true;
        }
        workerInstance_2.onmessage = (e: MessageEvents): void => {
