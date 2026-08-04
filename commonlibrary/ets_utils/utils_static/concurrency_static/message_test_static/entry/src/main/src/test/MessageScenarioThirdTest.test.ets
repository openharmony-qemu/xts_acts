'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
} from "../../../hypium/index";
import Utils from './Util.test';

class MessageObject {
  id: number

  constructor(id: number) {
    this.id = id;
  }
}

interface NestedInner {
  value: number
}

interface NestedOuter {
  inner: NestedInner
}

interface NestedData {
  outer: NestedOuter
  data: Array<number>
}

interface PlainData {
  name: string
  value: number
  active: boolean
}

interface NullData {
  isNull: boolean
}

type CB = () => void;

export default function MessageScenarioThirdTest(): void {
  describe('MessageScenarioThirdTest', (): void => {
    afterEach((): void => {
    })

    /**
     * @tc.name   MessageScenarioThirdTest0100
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0100
     * @tc.desc   Test shared object data consistency in message passing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0100';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let finalValue: number = 0;
        let finalData = "";
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const obj = msg.getObject() as MessageObject;
            if (obj && obj.id === 100) {
              finalValue = obj.id;
              finalData = "test";
              flag = true;
            }
          }, worker);

          const obj1 = new MessageObject(100);
          const message1 = new concurrency.Message(1, obj1, handler);
          handler.sendMessage(message1);

          const obj2 = new MessageObject(200);
          const message2 = new concurrency.Message(2, obj2, handler);
          handler.sendMessage(message2);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(finalValue).assertEqual(100);
          expect(finalData).assertEqual("test");
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest0200
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0200
     * @tc.desc   Test message processing order guarantee
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0200';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        const MESSAGE_COUNT = 50;
        let processCount = 0;
        let flag: boolean = false;
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            processCount++;
            if (processCount >= MESSAGE_COUNT) {
              flag = true;
            }
          }, worker);

          // Send sequential messages
          for (let i = 0; i < MESSAGE_COUNT; i++) {
            const message = new concurrency.Message(i, handler);
            handler.sendMessage(message);
          }

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(processCount).assertEqual(MESSAGE_COUNT);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest0300
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0300
     * @tc.desc   Test mixed types of messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0300';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let messageCount = 0;
        let flag: boolean = false;
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            messageCount++;
            if (messageCount >= 4) {
              flag = true;
            }
          }, worker);

          // Message with what only
          const msg1 = new concurrency.Message(1, handler);
          handler.sendMessage(msg1);

          // Message with what and object
          const msg2 = new concurrency.Message(2, "test object", handler);
          handler.sendMessage(msg2);

          // Message with callback
          const msg3 = new concurrency.Message(() => {
            console.log("Callback message");
          }, handler);
          msg3.sendToTarget();

          // Message with handler only
          const msg4 = new concurrency.Message(handler);
          handler.sendMessage(msg4);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(messageCount).assertEqual(4);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest0400
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0400
     * @tc.desc   Test various what values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0400';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let receivedWhat: Array<number> = [];
        let flag: boolean = false;
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedWhat.push(msg.getWhat());
            if (receivedWhat.length >= 5) {
              flag = true;
            }
          }, worker);

          const testValues = [0, 1, 100, 65535, -1];
          for (const val of testValues) {
            const message = new concurrency.Message(val, handler);
            handler.sendMessage(message);
          }

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedWhat.length).assertEqual(testValues.length);
          for (const val of testValues) {
            expect(receivedWhat.includes(val)).assertTrue();
          }
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest0500
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0500
     * @tc.desc   Test empty string as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0500';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedString = "";
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedString = msg.getObject() as string;
            flag = true;
          }, worker);

          const message = new concurrency.Message(1, "", handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedString).assertEqual("");
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest0600
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0600
     * @tc.desc   Test Unicode string as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0600';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedString = "";
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedString = msg.getObject() as string;
            flag = true;
          }, worker);

          const unicodeString = "Hello世界🌍🎉";
          const message = new concurrency.Message(1, unicodeString, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedString).assertEqual(unicodeString);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest0700
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0700
     * @tc.desc   Test long string as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0700';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedLength = 0;
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            const str = msg.getObject() as string;
            receivedLength = str.length;
            flag = true;
          }, worker);

          const longString = 'A'.repeat(5000);
          const message = new concurrency.Message(1, longString, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedLength).assertEqual(5000);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.name   MessageScenarioThirdTest0800
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0800
     * @tc.desc   Test boundary values for what parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0800';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let processCount = 0;
        let flag: boolean = false;
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            processCount++;
            if (processCount >= 7) {
              flag = true;
            }
          }, worker);

          const boundaryValues = [
            Int.MIN_VALUE,
            -65536,
            -1,
            0,
            1,
            65535,
            Int.MAX_VALUE
          ];

          for (const what of boundaryValues) {
            const message = new concurrency.Message(what, handler);
            handler.sendMessage(message);
          }

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(processCount).assertEqual(boundaryValues.length);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });


    /**
     * @tc.name   MessageScenarioThirdTest0900
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_0900
     * @tc.desc   Test messages with different object types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest0900';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let processCount = 0;
        let flag: boolean = false;
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            processCount++;
            if (processCount >= 4) {
              flag = true;
            }
          }, worker);

          // String object
          const msg1 = new concurrency.Message(1, "string test", handler);
          handler.sendMessage(msg1);

          // Number object
          const msg2 = new concurrency.Message(2, 12345, handler);
          handler.sendMessage(msg2);

          // Boolean object
          const msg3 = new concurrency.Message(3, true, handler);
          handler.sendMessage(msg3);

          // Custom object
          const obj = new MessageObject(999);
          const msg4 = new concurrency.Message(4, obj, handler);
          handler.sendMessage(msg4);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(processCount).assertEqual(4);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1000
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1000
     * @tc.desc   Test plain object as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1000';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedObj: PlainData = { name: "", value: 0, active: false };
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedObj = msg.getObject() as PlainData;
            flag = true;
          }, worker);

          const plainObj: PlainData = { name: "test", value: 123, active: true };
          const message = new concurrency.Message(1, plainObj, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedObj.name).assertEqual("test");
          expect(receivedObj.value).assertEqual(123);
          expect(receivedObj.active).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1100
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1100
     * @tc.desc   Test array object as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1100';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedArray: Array<number> = [];
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedArray = msg.getObject() as Array<number>;
            flag = true;
          }, worker);

          const testArray: Array<number> = [1, 2, 3, 4, 5];
          const message = new concurrency.Message(1, testArray, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedArray.length).assertEqual(5);
          expect(receivedArray[0]).assertEqual(1);
          expect(receivedArray[4]).assertEqual(5);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1200
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1200
     * @tc.desc   Test Map object as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1200';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedMap: Map<string, number> = new Map<string, number>();
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedMap = msg.getObject() as Map<string, number>;
            flag = true;
          }, worker);

          const testMap: Map<string, number> = new Map<string, number>([
            ["key1", 100],
            ["key2", 200]
          ]);
          const message = new concurrency.Message(1, testMap, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedMap.size).assertEqual(2);
          expect(receivedMap.get("key1")).assertEqual(100);
          expect(receivedMap.get("key2")).assertEqual(200);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1300
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1300
     * @tc.desc   Test Set object as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1300';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedSet: Set<number> = new Set<number>();
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedSet = msg.getObject() as Set<number>;
            flag = true;
          }, worker);

          const testSet: Set<number> = new Set<number>([10, 20, 30]);
          const message = new concurrency.Message(1, testSet, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedSet.size).assertEqual(3);
          expect(receivedSet.has(10)).assertEqual(true);
          expect(receivedSet.has(30)).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1400
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1400
     * @tc.desc   Test Date object as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1400';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedDate: Date = new Date();
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedDate = msg.getObject() as Date;
            flag = true;
          }, worker);

          const testDate: Date = new Date(2025, 0, 1);
          const message = new concurrency.Message(1, testDate, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedDate.getFullYear()).assertEqual(2025);
          expect(receivedDate.getMonth()).assertEqual(0);
          expect(receivedDate.getDate()).assertEqual(1);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1500
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1500
     * @tc.desc   Test null as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1500';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedNull: NullData = { isNull: false };
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedNull = msg.getObject() as NullData;
            flag = true;
          }, worker);

          const nullObj: NullData = { isNull: true };
          const message = new concurrency.Message(1, nullObj, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedNull.isNull).assertEqual(true);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1600
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1600
     * @tc.desc   Test nested object as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1600';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedObj: NestedData = {
          outer: { inner: { value: 0 } },
          data: []
        };
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedObj = msg.getObject() as NestedData;
            flag = true;
          }, worker);

          const nestedObj: NestedData = {
            outer: {
              inner: {
                value: 999
              }
            },
            data: [1, 2, 3]
          };
          const message = new concurrency.Message(1, nestedObj, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedObj.outer.inner.value).assertEqual(999);
          expect(receivedObj.data.length).assertEqual(3);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1700
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1700
     * @tc.desc   Test empty object as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1700';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedObj: Object = {};
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedObj = msg.getObject() as Object;
            flag = true;
          }, worker);

          const emptyObj: Object = {};
          const message = new concurrency.Message(1, emptyObj, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          const keys = Object.keys(receivedObj);
          expect(keys.length).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });

    /**
     * @tc.name   MessageScenarioThirdTest1800
     * @tc.number SUB_MESSAGE_SCENARIO_THIRD_TEST_1800
     * @tc.desc   Test empty array as message data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageScenarioThirdTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        const TAG: string = 'MessageScenarioThirdTest1800';
        console.info(`${TAG} test start`);
        const worker = new EAWorker();
        let flag: boolean = false;
        let receivedArray: Array<number> = [];
        worker.start();
        try {
          const handler = new concurrency.MessageHandler((msg: concurrency.Message) => {
            receivedArray = msg.getObject() as Array<number>;
            flag = true;
          }, worker);

          const emptyArray: Array<number> = [];
          const message = new concurrency.Message(1, emptyArray, handler);
          handler.sendMessage(message);

          let waitCount: int = 0;
          while (!flag && waitCount < 50) {
            waitCount++;
            await Utils.msSleep(100);
          }
          expect(flag).assertTrue();

          expect(receivedArray.length).assertEqual(0);
        } catch (error) {
          console.error(`${TAG} catch error: ${error.message}`);
          expect(false).assertFail();
        } finally {
          try {
            worker.quit();
            worker.join().Await();
          } catch (error) {
            console.warn(`${TAG} catch quit error: ${error.message}`);
          }
          console.info(`${TAG} test end`);
          done();
        }
      });
  });
}
