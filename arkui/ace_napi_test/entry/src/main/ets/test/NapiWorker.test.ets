/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, expect, it, TestType, Size, Level, beforeEach } from '@ohos/hypium';
import { worker } from '@kit.ArkTS';
import napitest from 'libnapitest.so';

export const sleep = (ms: number | undefined) => {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

export default function NapiWorkerTest() {

  describe('napiWorkerTest', () => {
    beforeEach(async () => {
      await sleep(50);
    });

    /**
     * @tc.name   testNapiWorker0001
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0100
     * @tc.desc   NapiWorkerTest getLastError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0001';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getLastError');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(2000);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0002
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0200
     * @tc.desc   NapiWorkerTest isError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0002';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('isError');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(false);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0003
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0300
     * @tc.desc   NapiWorkerTest createError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0003';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createError');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0004
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0400
     * @tc.desc   NapiWorkerTest createRangeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0004';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createRangeError');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0005
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0500
     * @tc.desc   NapiWorkerTest isExceptionPending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0005';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('isExceptionPending');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0006
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0600
     * @tc.desc   NapiWorkerTest createReference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0006';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createReference');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0007
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0700
     * @tc.desc   NapiWorkerTest referenceRefAndUnref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0007';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('referenceRefAndUnref');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0008
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0800
     * @tc.desc   NapiWorkerTest createArrayAndGetLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0008';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createArrayAndGetLength');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual('[1,2]');
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0009
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_0900
     * @tc.desc   NapiWorkerTest createExternal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0009';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createExternal');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0010
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1000
     * @tc.desc   NapiWorkerTest createExternalArraybuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0010';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createExternalArraybuffer');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0011
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1100
     * @tc.desc   NapiWorkerTest createObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0011';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createObject');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0012
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1200
     * @tc.desc   NapiWorkerTest createSymbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0012';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createSymbol');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0013
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1300
     * @tc.desc   NapiWorkerTest createTypeArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0013';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createTypeArray');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0014
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1400
     * @tc.desc   NapiWorkerTest getValueBool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0014';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getValueBool');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertFalse();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0015
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1500
     * @tc.desc   NapiWorkerTest createAndGetInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0015';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createAndGetInt32');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(32);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0016
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1600
     * @tc.desc   NapiWorkerTest createAndGetUInt32
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0016';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createAndGetUInt32');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(32);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0017
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1700
     * @tc.desc   NapiWorkerTest createAndGetInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0017';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createAndGetInt64');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(23);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0018
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1800
     * @tc.desc   NapiWorkerTest createDouble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0018';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createDouble');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(24.67);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0019
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_1900
     * @tc.desc   NapiWorkerTest createAndGetStringUtf16
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0019';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createAndGetStringUtf16');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual('he');
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0020
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2000
     * @tc.desc   NapiWorkerTest stringUtf16OfCase
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0020';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('stringUtf16OfCase');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual('abc2');
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0021
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2100
     * @tc.desc   NapiWorkerTest getValueDouble
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0021';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getValueDouble');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(24.5);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0022
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2200
     * @tc.desc   NapiWorkerTest getValueExternal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0022';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getValueExternal');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0023
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2300
     * @tc.desc   NapiWorkerTest getNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0023';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getNull');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0024
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2400
     * @tc.desc   NapiWorkerTest getUndefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0024';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getUndefined');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0025
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2500
     * @tc.desc   NapiWorkerTest coerceToBool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0025';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('coerceToBool');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertFalse();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0026
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2600
     * @tc.desc   NapiWorkerTest coerceToNumber
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0026';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('coerceToNumber');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(12);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0027
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2700
     * @tc.desc   NapiWorkerTest coerceToObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0027';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('coerceToObject');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual('[2,3]');
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0028
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2800
     * @tc.desc   NapiWorkerTest coerceToString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0028';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('coerceToString');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual('123');
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0029
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_2900
     * @tc.desc   NapiWorkerTest typeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0029';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('typeOf');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0030
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3000
     * @tc.desc   NapiWorkerTest isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0030';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('isArray');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0031
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3100
     * @tc.desc   NapiWorkerTest strictEquals
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0031';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('strictEquals');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0032
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3200
     * @tc.desc   NapiWorkerTest getPropertyNames
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0032';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getPropertyNames');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0033
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3300
     * @tc.desc   NapiWorkerTest setProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0033';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('setProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0034
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3400
     * @tc.desc   NapiWorkerTest getProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0034';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0035
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3500
     * @tc.desc   NapiWorkerTest hasProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0035';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('hasProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0036
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3600
     * @tc.desc   NapiWorkerTest setAndDeleteProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0036';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('setAndDeleteProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0037
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3700
     * @tc.desc   NapiWorkerTest hasOwnProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0037';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('hasOwnProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0038
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3800
     * @tc.desc   NapiWorkerTest setNamedProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0038';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('setNamedProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0039
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_3900
     * @tc.desc   NapiWorkerTest getNamedProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0039';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getNamedProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual('zhangsan');
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0040
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4000
     * @tc.desc   NapiWorkerTest hasNamedProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0040';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('hasNamedProperty');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0041
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4100
     * @tc.desc   NapiWorkerTest setElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0041';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('setElement');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0042
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4200
     * @tc.desc   NapiWorkerTest getElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0042';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getElement');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0043
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4300
     * @tc.desc   NapiWorkerTest hasElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0043';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('hasElement');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0044
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4400
     * @tc.desc   NapiWorkerTest deleteElement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0044';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('deleteElement');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0045
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4500
     * @tc.desc   NapiWorkerTest defineProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0045';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('defineProperties');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0046
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4600
     * @tc.desc   NapiWorkerTest callFunctionNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0046';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('callFunctionNull');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0047
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4700
     * @tc.desc   NapiWorkerTest napiCreateFunctionFuncNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0047';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiCreateFunctionFuncNull');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0048
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4800
     * @tc.desc   NapiWorkerTest napiGetCbInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0048';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiGetCbInfo');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(12.06);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0049
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_4900
     * @tc.desc   NapiWorkerTest unwrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0049';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('unwrap');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0050
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5000
     * @tc.desc   NapiWorkerTest removeWrap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0050';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('removeWrap');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0051
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5100
     * @tc.desc   NapiWorkerTest getVersion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0051';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getVersion');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(8);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0052
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5200
     * @tc.desc   NapiWorkerTest createPromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0052';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createPromise');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0053
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5300
     * @tc.desc   NapiWorkerTest resolveAndRejectDeferred
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0053';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('resolveAndRejectDeferred');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0054
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5400
     * @tc.desc   NapiWorkerTest isPromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0054';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('isPromise');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0055
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5500
     * @tc.desc   NapiWorkerTest napiCreateThreadsafeFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0055';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiCreateThreadsafeFunction');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0056
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5600
     * @tc.desc   NapiWorkerTest napiDeleteSerializationData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0056';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiDeleteSerializationDataTest');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(2000);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0057
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5700
     * @tc.desc   NapiWorkerTest napiCallThreadsafeFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0057';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiCallThreadsafeFunction');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0058
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5800
     * @tc.desc   NapiWorkerTest napiAnotherThreadSafeTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0058';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiAnotherThreadSafeTest');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0059
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_5900
     * @tc.desc   NapiWorkerTest napiRefThreadsafeFunction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0059';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiRefThreadsafeFunction');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0060
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6000
     * @tc.desc   NapiWorkerTest napiCreateDate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0060';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiCreateDate');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0061
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6100
     * @tc.desc   NapiWorkerTest napiCreateBigintInt64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0061';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiCreateBigintInt64');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0062
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6200
     * @tc.desc   NapiWorkerTest napiCreateBigintUint64
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0062';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiCreateBigintUint64');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0063
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6300
     * @tc.desc   NapiWorkerTest napiCreateBigintWords
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0063';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiCreateBigintWords');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0064
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6400
     * @tc.desc   NapiWorkerTest GetAllPropertyNamesEnvNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0064';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('GetAllPropertyNamesEnvNull');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0065
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6500
     * @tc.desc   NapiWorkerTest napiSetInstanceData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0065';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiSetInstanceData');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0066
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6600
     * @tc.desc   NapiWorkerTest getModuleFileName
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0066';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('getModuleFileName');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(Number(e.data) < 0).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0067
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6700
     * @tc.desc   NapiWorkerTest createAsyncResource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0067';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createAsyncResource');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data instanceof Object).assertTrue();
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0068
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6800
     * @tc.desc   NapiWorkerTest asyncWorkWithQos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0068';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('asyncWorkWithQos');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0069
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_6900
     * @tc.desc   NapiWorkerTest napiRunScriptPathEnvNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0069';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiRunScriptPathEnvNull');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0070
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_7000
     * @tc.desc   NapiWorkerTest napiLoadModule
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const value = napitest.napiLoadModule();
      expect(value).assertEqual(0);
    });

    /**
     * @tc.name   testNapiWorker0071
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_7100
     * @tc.desc   NapiWorkerTest createObjectWithProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0071';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createObjectWithProperties');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0072
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_7200
     * @tc.desc   NapiWorkerTest createObjectWithNamedProperties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0072';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('createObjectWithNamedProperties');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(0);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0073
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_7300
     * @tc.desc   NapiWorkerTest coerceToNativeBindingObjectEnvNull
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0073';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('coerceToNativeBindingObjectEnvNull');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(1);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0074
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_7400
     * @tc.desc   NapiWorkerTest napiSerialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0074';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiSerializeTest');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(2000);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiWorker0075
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_WORKER_7500
     * @tc.desc   NapiWorkerTest napiDeSerialize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiWorker0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiWorker0075';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiDeSerializeTest');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(2000);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0001
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0100
     * @tc.desc   NapiTaskTest NapiIsSendable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0001';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('napiIsSendableTest');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(false);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0002
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0200
     * @tc.desc   NapiTaskTest NapiCreateSendableObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0002';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('NapiCreateSendableObject');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0003
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0300
     * @tc.desc   NapiTaskTest NapiCreateSendableArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0003';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('NapiCreateSendableArray');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0004
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0400
     * @tc.desc   NapiTaskTest NapiCreateSendableArrayWithLength
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0004';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('NapiCreateSendableArrayWithLength');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0005
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0500
     * @tc.desc   NapiTaskTest NapiCreateSendableArrayBuffer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0005';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('NapiCreateSendableArrayBuffer');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0006
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0600
     * @tc.desc   NapiTaskTest NapiCreateSendableTypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0006';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('NapiCreateSendableTypedArray');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0007
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0700
     * @tc.desc   NapiTaskTest NapiWrapSendable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0007';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('NapiWrapSendable');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });

    /**
     * @tc.name   testNapiSendableWorker0008
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_0800
     * @tc.desc   NapiTaskTest NapiWrapSendableWithSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiSendableWorker0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const caseName = 'testNapiSendableWorker0008';
      const myWorker = new worker.ThreadWorker('../workers/MyWorker.ets');
      myWorker.postMessage('NapiWrapSendableWithSize');
      await new Promise<void>((resolve, reject) => {
        let resolved = false;
        myWorker.onmessage = (e) => {
          try {
            expect(e.data).assertEqual(true);
            resolved = true;
            myWorker.terminate();
            resolve();
          } catch (error) {
            myWorker.terminate();
            reject(error);
          }
        };
        myWorker.onexit = () => {
          if (!resolved) {
            reject(new Error(`${caseName}: Worker exited without sending result`));
          }
        };
        myWorker.onerror = (e) => {
          myWorker.terminate();
          reject(e);
        };
      });
    });
  })
}
