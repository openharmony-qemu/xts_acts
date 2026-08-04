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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

class MessageConstructorWhatObjTestData {
  name: string = "";
  age: number = 0;
}

export default function MessageConstructorWhatObjTest(): void {
  describe('MessageConstructorWhatObjTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0100
     * @tc.desc   Verify Message(what, obj, handler) creates instance with valid parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "hello", messageHandler);
      expect(msg.getWhat()).assertEqual(1);
      expect(msg.getObject() as string).assertEqual("hello");
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0200
     * @tc.desc   Verify Message(100, obj, handler).getWhat() returns 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(100, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0300
     * @tc.desc   Verify Message(0, obj, handler).getWhat() returns 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(0);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0400
     * @tc.desc   Verify Message(-1, obj, handler).getWhat() returns -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-1, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(-1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0500
     * @tc.desc   Verify Message with int max value 2147483647 returns correct what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(2147483647, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(2147483647);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0600
     * @tc.desc   Verify Message with int min value -2147483648 returns correct what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-2147483648, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(-2147483648);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0700
     * @tc.desc   Verify Message with special value -1000000 which is the default what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(-1000000, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(-1000000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0800
     * @tc.desc   Verify Message with what values near -1000000 boundary
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(-1000001, "data1", messageHandler);
      let msg2 = new concurrency.Message(-999999, "data2", messageHandler);
      expect(msg1.getWhat()).assertEqual(-1000001);
      expect(msg2.getWhat()).assertEqual(-999999);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest0900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_0900
     * @tc.desc   Verify Message with hex literal 0xFF returns getWhat 255
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0xFF, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(255);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1000
     * @tc.desc   Verify Message with octal literal 0o755 returns getWhat 493
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0o755, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(493);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1100
     * @tc.desc   Verify Message with binary literal 0b1010 returns getWhat 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(0b1010, "data", messageHandler);
      expect(msg.getWhat()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1200
     * @tc.desc   Verify Message with obj as normal string returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "hello", messageHandler);
      expect(msg.getObject() as string).assertEqual("hello");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1300
     * @tc.desc   Verify Message with obj as empty string returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "", messageHandler);
      expect(msg.getObject() as string).assertEqual("");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1400
     * @tc.desc   Verify Message with obj as special character string returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "hello\nworld\t!", messageHandler);
      expect(msg.getObject() as string).assertEqual("hello\nworld\t!");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1500
     * @tc.desc   Verify Message with obj as Unicode string returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "你好世界", messageHandler);
      expect(msg.getObject() as string).assertEqual("你好世界");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1600
     * @tc.desc   Verify Message with obj as long string returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let longStr = "a".repeat(10000);
      let msg = new concurrency.Message(1, longStr, messageHandler);
      expect(msg.getObject() as string).assertEqual(longStr);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1700
     * @tc.desc   Verify Message with obj as integer 42 returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, 42, messageHandler);
      expect(msg.getObject() as int).assertEqual(42);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1800
     * @tc.desc   Verify Message with obj as float 3.14159 returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, 3.14159, messageHandler);
      expect(msg.getObject() as number).assertEqual(3.14159);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest1900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_1900
     * @tc.desc   Verify Message with obj as zero and negative number returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, 0, messageHandler);
      let msg2 = new concurrency.Message(1, -100, messageHandler);
      expect(msg1.getObject() as int).assertEqual(0);
      expect(msg2.getObject() as int).assertEqual(-100);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2000
     * @tc.desc   Verify Message with obj as boolean true returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, true, messageHandler);
      expect(msg.getObject() as boolean).assertEqual(true);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2100
     * @tc.desc   Verify Message with obj as boolean false returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, false, messageHandler);
      expect(msg.getObject() as boolean).assertEqual(false);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2200
     * @tc.desc   Verify Message with obj as empty array returns correct getObject reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data: int[] = [];
      let msg = new concurrency.Message(1, data, messageHandler);
      expect(msg.getObject() === data).assertTrue();
      expect(data.length).assertEqual(0);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2300
     * @tc.desc   Verify Message with obj as multi-element array returns correct getObject reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data: int[] = [1, 2, 3];
      let msg = new concurrency.Message(1, data, messageHandler);
      expect(msg.getObject() === data).assertTrue();
      expect(data.length).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2400
     * @tc.desc   Verify Message with obj as empty object returns correct getObject reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data = new MessageConstructorWhatObjTestData();
      let msg = new concurrency.Message(1, data, messageHandler);
      expect(msg.getObject() === data).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2500
     * @tc.desc   Verify Message with obj as single-property object returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data = new MessageConstructorWhatObjTestData();
      data.name = "value";
      let msg = new concurrency.Message(1, data, messageHandler);
      expect(msg.getObject() === data).assertTrue();
      expect(data.name).assertEqual("value");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2600
     * @tc.desc   Verify Message with obj as multi-property object returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data = new MessageConstructorWhatObjTestData();
      data.name = "text";
      data.age = 30;
      let msg = new concurrency.Message(1, data, messageHandler);
      expect(msg.getObject() === data).assertTrue();
      expect(data.name).assertEqual("text");
      expect(data.age).assertEqual(30);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2700
     * @tc.desc   Verify Message with obj as nested object returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let inner = new MessageConstructorWhatObjTestData();
      inner.name = "innerValue";
      let msg = new concurrency.Message(1, inner, messageHandler);
      expect(msg.getObject() === inner).assertTrue();
      expect(inner.name).assertEqual("innerValue");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2800
     * @tc.desc   Verify Message with obj as number zero returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, 0, messageHandler);
      expect(msg.getObject() as int).assertEqual(0);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest2900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_2900
     * @tc.desc   Verify Message with obj as arrow function returns correct function reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let fn = (): string => "hello";
      let msg = new concurrency.Message(1, fn, messageHandler);
      expect(msg.getObject() === fn).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3000
     * @tc.desc   Verify Message with obj as custom class instance returns correct getObject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let user = new MessageConstructorWhatObjTestData();
      user.name = "Alice";
      user.age = 30;
      let msg = new concurrency.Message(1, user, messageHandler);
      expect(msg.getObject() === user).assertTrue();
      expect(user.name).assertEqual("Alice");
      expect(user.age).assertEqual(30);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3100
     * @tc.desc   Verify Message.getTarget() returns the same handler passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "data", messageHandler);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3200
     * @tc.desc   Verify Message with handler callback via sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, "test", messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3300
     * @tc.desc   Verify Message with different MessageHandler instances returns correct target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
      let msg1 = new concurrency.Message(1, "data1", handler1);
      let msg2 = new concurrency.Message(2, "data2", handler2);
      expect(msg1.getTarget()).assertEqual(handler1);
      expect(msg2.getTarget()).assertEqual(handler2);
      expect(msg1.getTarget() !== msg2.getTarget()).assertTrue();
      if (eaw1.isAlive()) { eaw1.quit(); }
      if (eaw2.isAlive()) { eaw2.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3400
     * @tc.desc   Verify all normal parameter combination with what, obj and handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data = new MessageConstructorWhatObjTestData();
      data.name = "test";
      data.age = 1;
      let msg = new concurrency.Message(100, data, messageHandler);
      expect(msg.getWhat()).assertEqual(100);
      expect(msg.getTarget()).assertEqual(messageHandler);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3500
     * @tc.desc   Verify boundary value combination with int max and empty obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data = new MessageConstructorWhatObjTestData();
      let msg = new concurrency.Message(2147483647, data, messageHandler);
      expect(msg.getWhat()).assertEqual(2147483647);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3600
     * @tc.desc   Verify boundary value combination with int min and empty obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data = new MessageConstructorWhatObjTestData();
      let msg = new concurrency.Message(-2147483648, data, messageHandler);
      expect(msg.getWhat()).assertEqual(-2147483648);
      expect(msg.getObject() === data).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3700
     * @tc.desc   Verify constructed Message instanceof concurrency.Message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "data", messageHandler);
      expect(msg instanceof concurrency.Message).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3800
     * @tc.desc   Verify Message.getWhat() returns exact variable value passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let testWhat: int = 12345;
      let testObj = "testData";
      let msg = new concurrency.Message(testWhat, testObj, messageHandler);
      expect(msg.getWhat()).assertEqual(testWhat);
      expect(msg.getObject() as string).assertEqual(testObj);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest3900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_3900
     * @tc.desc   Verify Message.getObject() returns exact value passed to constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageConstructorWhatObjTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let obj = new MessageConstructorWhatObjTestData();
      obj.name = "test";
      let msg = new concurrency.Message(1, obj, messageHandler);
      expect(msg.getObject() === obj).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4000
     * @tc.desc   Verify multiple Message instances are independent with different obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "data1", messageHandler);
      let msg2 = new concurrency.Message(2, "data2", messageHandler);
      expect(msg1.getWhat()).assertEqual(1);
      expect(msg2.getWhat()).assertEqual(2);
      expect(msg1.getObject() as string).assertEqual("data1");
      expect(msg2.getObject() as string).assertEqual("data2");
      expect(msg1 !== msg2).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4100
     * @tc.desc   Verify object reference modification affects Message.getObject result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let obj = new MessageConstructorWhatObjTestData();
      obj.age = 0;
      let msg = new concurrency.Message(1, obj, messageHandler);
      obj.age = 100;
      expect(msg.getObject() === obj).assertTrue();
      expect(obj.age).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4200
     * @tc.desc   Verify Message.equals() returns true for same what, obj and handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", messageHandler);
      let msg2 = new concurrency.Message(1, "hello", messageHandler);
      expect(msg1.equals(msg2)).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4300
     * @tc.desc   Verify Message.equals() returns false for different what values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(1, "hello", messageHandler);
      let msg2 = new concurrency.Message(2, "hello", messageHandler);
      expect(msg1.equals(msg2)).assertFalse();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4400
     * @tc.desc   Verify Message.getCallback() returns undefined for 3-param constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "data", messageHandler);
      expect(msg.getCallback() === undefined).assertTrue();
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4500
     * @tc.desc   Verify handler callback execution with AtomicInt counter via sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let receivedObj: string = "";
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, "test", messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4600
     * @tc.desc   Verify multiple messages processed in order by same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let msg1 = new concurrency.Message(1, "data1", handler);
      let msg2 = new concurrency.Message(2, "data2", handler);
      let msg3 = new concurrency.Message(3, "data3", handler);
      msg1.sendToTarget();
      msg2.sendToTarget();
      msg3.sendToTarget();
      let waitCount = 0;
      while (counter.load() < 3 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4700
     * @tc.desc   Verify creating Message inside MessageHandler callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let nestedCounter = new AtomicInt(0);
      let innerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        nestedCounter.fetchAdd(1);
      }, eaw);
      let outerHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let innerMsg = new concurrency.Message(100, "nested", innerHandler);
        innerMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message(1, "outer", outerHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (nestedCounter.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(nestedCounter.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4800
     * @tc.desc   Verify creating new Message to different handler in callback with obj data
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let secondReceived = new AtomicInt(0);
      let secondHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        secondReceived.fetchAdd(1);
      }, eaw);
      let firstHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let objData: string = "transferData";
        let newMsg = new concurrency.Message(2, objData, secondHandler);
        newMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message(1, "payload", firstHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (secondReceived.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(secondReceived.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest4900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_4900
     * @tc.desc   Verify AsyncLock protected shared state with Message sendToTarget
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let sharedCount = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        sharedCount.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(1, "test", messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (sharedCount.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(sharedCount.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5000
     * @tc.desc   Verify batch Message creation in loop with AtomicInt counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatObjTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let createdCount = new AtomicInt(0);
      let keys: string[] = ["k1", "k2", "k3"];
      let values: string[] = ["v1", "v2", "v3"];
      for (let i = 0; i < keys.length; i++) {
        let msg = new concurrency.Message(i + 1, values[i], handler);
        createdCount.fetchAdd(1);
      }
      expect(createdCount.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5100
     * @tc.desc   Verify AtomicReference stores and updates Message atomically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatObjTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let atomicRef = new AtomicReference<concurrency.Message | null>(null);
      let msg1 = new concurrency.Message(1, "v1", handler);
      atomicRef.store(msg1);
      expect(atomicRef.load()).assertEqual(msg1);
      let msg2 = new concurrency.Message(2, "v2", handler);
      let swapResult = atomicRef.compareAndSwap(msg1, msg2);
      expect(atomicRef.load()).assertEqual(msg2);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5200
     * @tc.desc   Verify concurrent Message creation with Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let counter = new AtomicInt(0);
      let createAndCount = async (): Promise<void> => {
        let msg = new concurrency.Message(1, "data", messageHandler);
        counter.fetchAdd(1);
      };
      await Promise.all([createAndCount(), createAndCount(), createAndCount()]);
      expect(counter.load()).assertEqual(3);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5300
     * @tc.desc   Verify concurrent Message sending to same handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let counter = new AtomicInt(0);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        counter.fetchAdd(1);
      }, eaw);
      let createAndSend = async (): Promise<void> => {
        let msg = new concurrency.Message(1, "data", messageHandler);
        msg.sendToTarget();
      };
      let tasks: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        tasks.push(createAndSend());
      }
      await Promise.all(tasks);
      let waitCount = 0;
      while (counter.load() < 10 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(counter.load()).assertEqual(10);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5400
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5400
     * @tc.desc   Verify different what values distinguish message types in handler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let typeACount = new AtomicInt(0);
      let typeBCount = new AtomicInt(0);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let what: int = msg.getWhat();
        if (what === 1) {
          typeACount.fetchAdd(1);
        } else if (what === 2) {
          typeBCount.fetchAdd(1);
        }
      }, eaw);
      let msgA = new concurrency.Message(1, "text", handler);
      let msgB = new concurrency.Message(2, "data", handler);
      msgA.sendToTarget();
      msgB.sendToTarget();
      let waitCount = 0;
      while ((typeACount.load() < 1 || typeBCount.load() < 1) && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(typeACount.load()).assertEqual(1);
      expect(typeBCount.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5500
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5500
     * @tc.desc   Verify complex nested data structure passed via obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let data = new MessageConstructorWhatObjTestData();
      data.name = "abc";
      let msg = new concurrency.Message(1, data, messageHandler);
      expect(msg.getObject() === data).assertTrue();
      expect(data.name).assertEqual("abc");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5600
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5600
     * @tc.desc   Verify chained message processing with obj data transfer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let step = new AtomicInt(0);
      let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        step.fetchAdd(1);
      }, eaw);
      let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        let objData: string = "chainData";
        let newMsg = new concurrency.Message(2, objData, handler2);
        newMsg.sendToTarget();
      }, eaw);
      let msg = new concurrency.Message(1, "step1", handler1);
      msg.sendToTarget();
      let waitCount = 0;
      while (step.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(step.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5700
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5700
     * @tc.desc   Verify Message with large data object passed via obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatObjTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let largeArray: int[] = [];
      for (let i = 0; i < 10000; i++) {
        largeArray.push(i);
      }
      let msg = new concurrency.Message(1, largeArray, messageHandler);
      expect(msg.getObject() === largeArray).assertTrue();
      expect(largeArray.length).assertEqual(10000);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5800
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5800
     * @tc.desc   Verify complete message lifecycle from creation to processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let processed = new AtomicInt(0);
      let receivedWhat = new AtomicInt(-1);
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
        processed.fetchAdd(1);
      }, eaw);
      let msg = new concurrency.Message(100, "lifecycle", handler);
      expect(processed.load()).assertEqual(0);
      msg.sendToTarget();
      let waitCount = 0;
      while (processed.load() < 1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(processed.load()).assertEqual(1);
      expect(receivedWhat.load()).assertEqual(100);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest5900
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_5900
     * @tc.desc   Verify while-loop wait pattern for concurrent message processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let completedCount = new AtomicInt(0);
      let totalCount: int = 10;
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        completedCount.fetchAdd(1);
      }, eaw);
      for (let i = 0; i < totalCount; i++) {
        let msg = new concurrency.Message(i, `data${i}`, handler);
        msg.sendToTarget();
      }
      let waitCount = 0;
      while (completedCount.load() < totalCount && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(completedCount.load()).assertEqual(totalCount);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest6000
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_6000
     * @tc.desc   Verify Message.getTarget() after handler EAWorker terminates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatObjTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg = new concurrency.Message(1, "data", handler);
      expect(msg.getTarget()).assertEqual(handler);
      if (eaw.isAlive()) { eaw.quit(); }
      expect(msg.getTarget()).assertEqual(handler);
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest6100
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_6100
     * @tc.desc   Verify comparison with single-param and two-param constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageConstructorWhatObjTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let msg1 = new concurrency.Message(messageHandler);
      let msg2 = new concurrency.Message(1, messageHandler);
      let msg3 = new concurrency.Message(1, "data", messageHandler);
      expect(msg1.getWhat()).assertEqual(-1000000);
      expect(msg2.getWhat()).assertEqual(1);
      expect(msg3.getWhat()).assertEqual(1);
      expect(msg2.getObject() === undefined).assertTrue();
      expect(msg3.getObject() as string).assertEqual("data");
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest6200
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_6200
     * @tc.desc   Verify Message handler callback accessing message properties with obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageConstructorWhatObjTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let receivedWhat = new AtomicInt(-1);
      let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
        receivedWhat.store(msg.getWhat());
      }, eaw);
      let msg = new concurrency.Message(42, "testData", messageHandler);
      msg.sendToTarget();
      let waitCount = 0;
      while (receivedWhat.load() === -1 && waitCount < 50) {
        waitCount++;
        await Utils.msSleep(100);
      }
      expect(receivedWhat.load()).assertEqual(42);
      if (eaw.isAlive()) { eaw.quit(); }
    })

    /**
     * @tc.name   MessageConstructorWhatObjTest6300
     * @tc.number SUB_MESSAGE_CONSTRUCTOR_WHAT_OBJ_TEST_6300
     * @tc.desc   Verify Atomics compareAndSwap for atomic branch Message creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageConstructorWhatObjTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      let flag = new AtomicInt(0);
      let createdCount = new AtomicInt(0);
      let prev = flag.compareAndSwap(0, 1);
      if (prev === 0) {
        let msg = new concurrency.Message(1, "data", handler);
        createdCount.fetchAdd(1);
      }
      expect(createdCount.load()).assertEqual(1);
      if (eaw.isAlive()) { eaw.quit(); }
    })
  })
}
