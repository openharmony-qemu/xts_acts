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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2012
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2011
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2010
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2009
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2008
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2007
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2006
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2005
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2004
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2003
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2002
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2001
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_9900
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_9800
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_9700
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_9600
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2016
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2015
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
     * @tc.number SUB_Runtime_Language_Backend_WorkerConcurrency_2014
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
