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
import worker, { ErrorEvent, MessageEvents } from '@ohos.worker'

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

export default function workerTest() {
  describe('ActsWorkerTest', () => {

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
     * @tc.name   testWorkerError001
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10100
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        let isTerminate: boolean = false;
        let flag: boolean = false;
        const workerInstances: worker.ThreadWorker[] = [];
        for (let i: number = 0; i < 64; i++) {
          workerInstances.push(new worker.ThreadWorker('../workers/worker.ts'));
        }
        try {
          const workerInstance_9: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
          workerInstance_9.terminate();
          expect().assertFail();
        } catch (error) {
          console.info(`${caseName}: catch error: code => ${error.code} message => ${error.message}`);
          flag = true;
          expectAssertEqual(error.code, 10200003);
          expectAssertContain(error.message, 'Worker initialization failed');
        }
        for (let i: number = 0; i < workerInstances.length; i++) {
          workerInstances[i].terminate();
        }
        workerInstances[7].onexit = (): void => {
          isTerminate = true;
        };
        while (!(isTerminate && flag)) {
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
     * @tc.name   testWorkerError002
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10200
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_022.ts', {
          type: 'module', name: 'first worker in Stage model', shared: false
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
     * @tc.name   testWorkerError003
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10300
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError004
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10400
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError005
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10500
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError006
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10600
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError007
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10700
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError008
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10800
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
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
     * @tc.name   testWorkerError009
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_10900
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError001';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_004.ts');
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
     * @tc.name   testWorkerError010
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11000
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError011
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11100
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError012
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11200
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError013
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11300
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError014
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11400
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker.ts');
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
     * @tc.name   testWorkerError015
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11500
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_010.ts');
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
     * @tc.name   testWorkerError016
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11600
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_012.ts');
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
     * @tc.name   testWorkerError017
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11700
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_013.ts');
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
     * @tc.name   testWorkerError018
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11800
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_014.ts');
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
     * @tc.name   testWorkerError019
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_11900
     * @tc.desc   test worker error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerError019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerError002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_015.ts');
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
     * @tc.name   testWorkerConstructor001
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0100
     * @tc.desc   test threadWorker constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor001';
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
          expectAssertEqual(e.data, 'workerInstance');
          workerInstance_2.postMessage(e.data);
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
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
     * @tc.name   testWorkerConstructor002
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0200
     * @tc.desc   test threadWorker constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor002';
      console.info(`${caseName} test start`);
      try {
        const workerInstance_1: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_003.ts', {
          name: 'workerInstance_1'
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
          name: 'workerInstance_2'
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
     * @tc.name   testWorkerConstructor003
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0300
     * @tc.desc   test threadWorker constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerConstructor003';
      console.info(`${caseName} test start`);
      try {
        const workerInstance: worker.ThreadWorker = new worker.ThreadWorker('../xxx/worker.ts');
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
     * @tc.name   testWorkerPostMessage001
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0400
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage001';
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
          expectAssertEqual(e.data, 'string message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
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
     * @tc.name   testWorkerPostMessage002
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0500
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage002';
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
          expectAssertEqual(e.data, 'string message');
          workerInstance_2.postMessage('string message');
        }
        const workerInstance_2: worker.ThreadWorker = new worker.ThreadWorker('../workers/worker_002.ts');
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
     * @tc.name   testWorkerPostMessage003
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0600
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage003';
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
          expectAssertEqual(e.data, 100001);
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
     * @tc.name   testWorkerPostMessage004
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0700
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage004';
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
          expectAssertEqual(e.data, 100001);
          workerInstance_2.postMessage(100002);
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
     * @tc.name   testWorkerPostMessage005
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0800
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage005';
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
          expectAssertInstanceOf(e.data, 'Date');
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
     * @tc.name   testWorkerPostMessage006
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_0900
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage006';
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
          expectAssertInstanceOf(e.data, 'Date');
          const date2: Date = new Date();
          workerInstance_2.postMessage(date2);
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
     * @tc.name   testWorkerPostMessage007
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1000
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage007';
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
          expectAssertInstanceOf(e.data, 'RegExp');
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
     * @tc.name   testWorkerPostMessage008
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1100
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage008';
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
          expectAssertInstanceOf(e.data, 'RegExp');
          const re2: RegExp = new RegExp('worker2');
          workerInstance_2.postMessage(re2);
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
     * @tc.name   testWorkerPostMessage009
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1200
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage009';
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
          expectAssertInstanceOf(e.data, 'Array');
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
     * @tc.name   testWorkerPostMessage010
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1300
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage010';
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
     * @tc.name   testWorkerPostMessage011
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1400
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage011';
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
     * @tc.name   testWorkerPostMessage012
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1500
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage012';
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
     * @tc.name   testWorkerPostMessage013
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1600
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage013';
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
     * @tc.name   testWorkerPostMessage014
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1700
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage014';
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
     * @tc.name   testWorkerPostMessage015
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1800
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage015';
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
     * @tc.name   testWorkerPostMessage016
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_1900
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage016';
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
     * @tc.name   testWorkerPostMessage017
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2000
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage017';
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
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
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
          expectAssertInstanceOf(e.data, 'ArrayBuffer');
        }
        const buff1: ArrayBuffer = new ArrayBuffer(8);
        workerInstance_1.postMessage(buff1);
        const buff2: ArrayBuffer = new ArrayBuffer(16);
        workerInstance_2.postMessage(buff2);
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
     * @tc.name   testWorkerPostMessage018
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2100
     * @tc.desc   test host threads send messages to worker threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWorkerPostMessage018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'testWorkerPostMessage018';
      console.info(`${caseName} test start`);
      try {
