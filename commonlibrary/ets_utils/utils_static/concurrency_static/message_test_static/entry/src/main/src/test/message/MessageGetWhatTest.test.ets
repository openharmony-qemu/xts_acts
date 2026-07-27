'use static'
/*
 * Copyright (c) 2026 RKH Corp.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

type CB = () => void

export default function MessageGetWhatTest(): void {
  describe('MessageGetWhatTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageGetWhatTest0100
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0100
     * @tc.desc   Verify Message.getWhat() with no args returns default value -1000000 for constructor(handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetWhatTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(messageHandler);
      let what: int = msg.getWhat();
      expect(what).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest0200
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0200
     * @tc.desc   Verify Message.getWhat() returns specified what value for constructor(what, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetWhatTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let EmptyMessageType: int = 1;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(EmptyMessageType, messageHandler);
      let what: int = msg.getWhat();
      expect(what).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })



    /**
     * @tc.name   MessageGetWhatTest0300
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0300
     * @tc.desc   Verify Message.getWhat() returns default value -1000000 for constructor(callback, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetWhatTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback: CB = (): void => { console.info("this is callback message"); }
      let msg = new concurrency.Message(callback, messageHandler);
      let what: int = msg.getWhat();
      expect(what).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest0400
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0400
     * @tc.desc   Verify Message.getWhat() returns specified what value for constructor(what, obj, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetWhatTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let StringMessage: int = 2;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(StringMessage, "hello", messageHandler);
      let what: int = msg.getWhat();
      expect(what).assertEqual(2);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest0500
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0500
     * @tc.desc   Verify Message.getWhat() returns zero when what is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let zeroWhat: int = 0;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(zeroWhat, messageHandler);
      expect(msg.getWhat()).assertEqual(0);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest0600
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0600
     * @tc.desc   Verify Message.getWhat() returns max int value 2147483647
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let maxInt: int = 2147483647;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(maxInt, messageHandler);
      expect(msg.getWhat()).assertEqual(2147483647);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest0700
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0700
     * @tc.desc   Verify Message.getWhat() returns min int value -2147483648
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let minInt: int = -2147483648;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(minInt, messageHandler);
      expect(msg.getWhat()).assertEqual(-2147483648);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest0800
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0800
     * @tc.desc   Verify Message.getWhat() returns default -1000000 and explicit -1000000 both equal -1000000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msgDefault = new concurrency.Message(messageHandler);
      expect(msgDefault.getWhat()).assertEqual(-1000000);
      let defaultWhat: int = -1000000;
      let msgExplicit = new concurrency.Message(defaultWhat, messageHandler);
      expect(msgExplicit.getWhat()).assertEqual(-1000000);
      expect(msgDefault.getWhat()).assertEqual(msgExplicit.getWhat());
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest0900
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_0900
     * @tc.desc   Verify Message.getWhat() returns correct positive typical values 1, 100, 1000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      expect(msg1.getWhat()).assertEqual(1);
      let msg100 = new concurrency.Message(100, messageHandler);
      expect(msg100.getWhat()).assertEqual(100);
      let msg1000 = new concurrency.Message(1000, messageHandler);
      expect(msg1000.getWhat()).assertEqual(1000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1000
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1000
     * @tc.desc   Verify Message.getWhat() returns correct negative typical values -1 and -999999
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msgNeg1 = new concurrency.Message(-1, messageHandler);
      expect(msgNeg1.getWhat()).assertEqual(-1);
      let msgNeg999 = new concurrency.Message(-999999, messageHandler);
      expect(msgNeg999.getWhat()).assertEqual(-999999);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1100
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1100
     * @tc.desc   Verify Message.getWhat() return type is int
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      let what: int = msg.getWhat();
      expect(what).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1200
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1200
     * @tc.desc   Verify Message.getWhat() returns same value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetWhatTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(42, messageHandler);
      let what1: int = msg.getWhat();
      let what2: int = msg.getWhat();
      let what3: int = msg.getWhat();
      expect(what1).assertEqual(what2);
      expect(what2).assertEqual(what3);
      expect(what1).assertEqual(42);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1300
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1300
     * @tc.desc   Verify Message.getWhat() returns correct values for all four constructor types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(messageHandler);
      expect(msg1.getWhat()).assertEqual(-1000000);
      let msg2 = new concurrency.Message(1, messageHandler);
      expect(msg2.getWhat()).assertEqual(1);
      let msg3 = new concurrency.Message(2, "data", messageHandler);
      expect(msg3.getWhat()).assertEqual(2);
      let callback: CB = (): void => {}
      let msg4 = new concurrency.Message(callback, messageHandler);
      expect(msg4.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1400
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1400
     * @tc.desc   Verify Message.getWhat() concurrent read safety with Promise.all and AtomicInt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(100, messageHandler);
      let counter: AtomicInt = new AtomicInt(0);
      let results: int[] = [];
      let task1 = async (): Promise<void> => {
        let what: int = msg.getWhat();
        results.push(what);
        counter.fetchAdd(1);
      }
      let task2 = async (): Promise<void> => {
        let what: int = msg.getWhat();
        results.push(what);
        counter.fetchAdd(1);
      }
      let task3 = async (): Promise<void> => {
        let what: int = msg.getWhat();
        results.push(what);
        counter.fetchAdd(1);
      }
      await Promise.all([task1(), task2(), task3()]);
      let waitCount: int = 0;
      while (counter.load() < 3 && waitCount < 500) {
        waitCount++;
        await Utils.msSleep(10);
      }
      expect(counter.load()).assertEqual(3);
      expect(results.length).assertEqual(3);
      for (let i: int = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(100);
      }
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1500
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1500
     * @tc.desc   Verify Message.getWhat() works correctly in ArkTS-Sta environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetWhatTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, messageHandler);
      expect(msg.getWhat()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1600
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1600
     * @tc.desc   Verify Message.getWhat() in async function returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(42, messageHandler);
      let what: int = msg.getWhat();
      expect(what).assertEqual(42);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1700
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1700
     * @tc.desc   Verify Message.getWhat() in Promise.then chain returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(99, messageHandler);
      let result: int = await Promise.resolve().then((): int => {
        return msg.getWhat();
      });
      expect(result).assertEqual(99);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1800
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1800
     * @tc.desc   Verify Message.getWhat() with counter wait mechanism returns correct value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(777, messageHandler);
      let counter: int = 0;
      let whatValue: int = -1;
      while (counter < 10) {
        whatValue = msg.getWhat();
        counter++;
      }
      expect(whatValue).assertEqual(777);
      expect(counter).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest1900
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_1900
     * @tc.desc   Verify Message.getWhat() inside MessageHandler callback returns correct what value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedWhat: AtomicInt = new AtomicInt(-1);
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(123, messageHandler);
      msg.sendToTarget();
      let waitCount: int = 0;
      while (counter.load() < 1 && waitCount < 500) {
        waitCount++;
        await Utils.msSleep(10);
      }
      expect(receivedWhat.load()).assertEqual(123);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2000
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2000
     * @tc.desc   Verify Message.getWhat() with concurrent container Message array returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msgArray: concurrency.Message[] = [];
      msgArray.push(new concurrency.Message(1, messageHandler));
      msgArray.push(new concurrency.Message(2, messageHandler));
      msgArray.push(new concurrency.Message(3, messageHandler));
      let whatValues: int[] = [];
      for (let m of msgArray) {
        whatValues.push(m.getWhat());
      }
      expect(whatValues[0]).assertEqual(1);
      expect(whatValues[1]).assertEqual(2);
      expect(whatValues[2]).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2100
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2100
     * @tc.desc   Verify Message.getWhat() distinguishes message types by what value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let MESSAGE_TYPE_A: int = 1;
      let MESSAGE_TYPE_B: int = 2;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msgA = new concurrency.Message(MESSAGE_TYPE_A, messageHandler);
      let msgB = new concurrency.Message(MESSAGE_TYPE_B, messageHandler);
      let isTypeA: boolean = msgA.getWhat() === MESSAGE_TYPE_A;
      let isTypeB: boolean = msgB.getWhat() === MESSAGE_TYPE_B;
      expect(isTypeA).assertTrue();
      expect(isTypeB).assertTrue();
      expect(msgA.getWhat() !== msgB.getWhat()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })



    /**
     * @tc.name   MessageGetWhatTest2200
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2200
     * @tc.desc   Verify Message.getWhat() in MessageHandler callback with sendMessage returns correct what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedWhat: AtomicInt = new AtomicInt(-1);
      let counter: AtomicInt = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(123, handler);
      handler.sendMessage(msg);
      let waitCount: int = 0;
      while (counter.load() < 1 && waitCount < 500) {
        waitCount++;
        await Utils.msSleep(10);
      }
      expect(receivedWhat.load()).assertEqual(123);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2300
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2300
     * @tc.desc   Verify Message.getWhat() with equals method shows same what values are equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(1, messageHandler);
      let msg3 = new concurrency.Message(2, messageHandler);
      expect(msg1.getWhat()).assertEqual(msg2.getWhat());
      expect(msg1.getWhat() !== msg3.getWhat()).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2400
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2400
     * @tc.desc   Verify Message.getWhat() default value identifies untyped messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let DEFAULT_WHAT: int = -1000000;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msgWithDefault = new concurrency.Message(messageHandler);
      let msgWithCustom = new concurrency.Message(100, messageHandler);
      let isDefault: boolean = msgWithDefault.getWhat() === DEFAULT_WHAT;
      let isCustom: boolean = msgWithCustom.getWhat() !== DEFAULT_WHAT;
      expect(isDefault).assertTrue();
      expect(isCustom).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2500
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2500
     * @tc.desc   Verify Message.getWhat() returns same value before and after sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(55, messageHandler);
      let whatBefore: int = msg.getWhat();
      expect(whatBefore).assertEqual(55);
      msg.sendToTarget();
      let waitCount: int = 0;
      while (counter.load() < 1 && waitCount < 500) {
        waitCount++;
        await Utils.msSleep(10);
      }
      let whatAfter: int = msg.getWhat();
      expect(whatAfter).assertEqual(55);
      expect(whatBefore).assertEqual(whatAfter);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2600
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2600
     * @tc.desc   Verify Message.getWhat() with multiple Messages in array returns respective what values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let messages: concurrency.Message[] = [];
      messages.push(new concurrency.Message(10, messageHandler));
      messages.push(new concurrency.Message(20, messageHandler));
      messages.push(new concurrency.Message(30, messageHandler));
      let mapMsg0: concurrency.Message = messages[0];
      let mapMsg1: concurrency.Message = messages[1];
      let mapMsg2: concurrency.Message = messages[2];
      expect(mapMsg0.getWhat()).assertEqual(10);
      expect(mapMsg1.getWhat()).assertEqual(20);
      expect(mapMsg2.getWhat()).assertEqual(30);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2700
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2700
     * @tc.desc   Verify Message.getWhat() combined with getObject returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let StringMessage: int = 2;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(StringMessage, "hello", messageHandler);
      expect(msg.getWhat()).assertEqual(2);
      let objResult: Object | undefined = msg.getObject() as Object | undefined;
      expect(objResult !== undefined).assertTrue();
      expect(objResult as string).assertEqual("hello");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2800
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2800
     * @tc.desc   Verify Message.getWhat() combined with getCallback returns default what for callback Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let callback: CB = (): void => { console.info("this is callback message"); }
      let msg = new concurrency.Message(callback, messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      let retrievedCallback: CB | undefined = msg.getCallback();
      expect(retrievedCallback !== undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest2900
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_2900
     * @tc.desc   Verify Message.getWhat() inside callback context for nested Message returns correct what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let nestedWhatMatch: AtomicInt = new AtomicInt(0);
      let outerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let innerMsg = new concurrency.Message(2, msg.getTarget());
        let innerWhat: int = innerMsg.getWhat();
        if (innerWhat === 2) {
          nestedWhatMatch.fetchAdd(1);
        }
      }, eaw);
      let msg = new concurrency.Message(1, outerHandler);
      outerHandler.sendMessage(msg);
      let waitCount: int = 0;
      while (nestedWhatMatch.load() < 1 && waitCount < 500) {
        waitCount++;
        await Utils.msSleep(10);
      }
      expect(nestedWhatMatch.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest3000
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_3000
     * @tc.desc   Verify Message.getWhat() AtomicInt counter tracks concurrent getWhat from multiple Messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetWhatTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter: AtomicInt = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, messageHandler);
      let msg2 = new concurrency.Message(2, messageHandler);
      let msg3 = new concurrency.Message(3, messageHandler);
      let w1: int = msg1.getWhat();
      let w2: int = msg2.getWhat();
      let w3: int = msg3.getWhat();
      if (w1 === 1) { counter.fetchAdd(1); }
      if (w2 === 2) { counter.fetchAdd(1); }
      if (w3 === 3) { counter.fetchAdd(1); }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageGetWhatTest3100
     * @tc.number SUB_MESSAGE_GET_WHAT_TEST_3100
     * @tc.desc   Verify Message.getWhat() default value -1000000 not equal to common positive identifiers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetWhatTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let DEFAULT_WHAT: int = -1000000;
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msgDefault = new concurrency.Message(messageHandler);
      expect(msgDefault.getWhat()).assertEqual(DEFAULT_WHAT);
      expect(msgDefault.getWhat() !== 1).assertTrue();
      expect(msgDefault.getWhat() !== 100).assertTrue();
      expect(msgDefault.getWhat() !== 0).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })
  })
}
