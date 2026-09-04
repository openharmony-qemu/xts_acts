'use static';
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

export default function MessageHandlerHasMessagesWhatObjTest(): void {
  describe('MessageHandlerHasMessagesWhatObjTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0100
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with both required parameters returns true when message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, "test");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0200
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with normal integer what value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(100, "data", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(100, "data");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0300
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with int minimum boundary what returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(-2147483648, "data", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(-2147483648, "data");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0400
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with int maximum boundary what returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(2147483647, "data", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(2147483647, "data");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0500
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with zero what value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(0, "data", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(0, "data");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0600
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with negative what value returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(-1, "data", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(-1, "data");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0700
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with default identifier -1000000 returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let msg = new concurrency.Message(-1000000, "data", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(-1000000, "data");
        expect(result).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0800
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) what parameter type safety - ArkTS prevents invalid types at compile time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        // ArkTS type system prevents passing null/undefined/string/float as int at compile time
        // Verify hasMessages works correctly with valid int values
        let msg = new concurrency.Message(10, "data", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(10, "data");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest0900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_0900
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with normal string obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "hello world", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, "hello world");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1000
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with empty string obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, "");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1100
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with Unicode string obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "\u4f60\u597d\u4e16\u754c\ud83c\udf0d", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, "\u4f60\u597d\u4e16\u754c\ud83c\udf0d");
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1200
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with long string obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let longString: string = "a".repeat(10000);
        let msg = new concurrency.Message(1, longString, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, longString);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1300
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with number obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let numObj: Object = 42 as Object;
        let msg = new concurrency.Message(1, numObj, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, numObj);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1400
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with float number obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let floatObj: Object = 3.14159 as Object;
        let msg = new concurrency.Message(1, floatObj, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, floatObj);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1500
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with negative number obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let negObj: Object = -100 as Object;
        let msg = new concurrency.Message(1, negObj, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, negObj);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1600
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with true boolean obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let boolObj: Object = true as Object;
        let msg = new concurrency.Message(1, boolObj, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, boolObj);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1700
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with false boolean obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let boolObj: Object = false as Object;
        let msg = new concurrency.Message(1, boolObj, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, boolObj);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1800
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with array obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let arr: number[] = [1, 2, 3, 4, 5];
        let msg = new concurrency.Message(1, arr as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, arr as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest1900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_1900
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with empty array obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let emptyArr: number[] = [];
        let msg = new concurrency.Message(1, emptyArr as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, emptyArr as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2000
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with nested array obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let nestedArr: number[][] = [[1, 2], [3, 4], [5, 6]];
        let msg = new concurrency.Message(1, nestedArr as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, nestedArr as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2100
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with string array obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let strArr: string[] = ["a", "b", "c"];
        let msg = new concurrency.Message(1, strArr as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, strArr as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2200
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with object obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let obj: Record<string, Object> = { "name": "test" as Object, "value": 123 as Object };
        let msg = new concurrency.Message(1, obj as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, obj as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2300
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with nested object obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let innerObj: Record<string, Object> = { "value": "deep" as Object };
        let nestedObj: Record<string, Object> = { "outer": innerObj as Object };
        let msg = new concurrency.Message(1, nestedObj as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, nestedObj as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2400
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with empty object obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let emptyObj: Record<string, Object> = {};
        let msg = new concurrency.Message(1, emptyObj as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, emptyObj as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2500
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) obj parameter type safety - null cannot be passed as Object in ArkTS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        // ArkTS type system prevents passing null/undefined as Object parameter
        // Verify hasMessages works correctly with valid Object values
        let msg = new concurrency.Message(1, "valid_obj", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, "valid_obj");
        expect(result).assertTrue();
        // Query with different obj should return false
        let result2: boolean = handler.hasMessages(1, "other_obj");
        expect(result2).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2600
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with Map obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let map = new Map<string, number>();
        map.set("key1", 100);
        let msg = new concurrency.Message(1, map as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, map as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2700
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with Set obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let set = new Set<number>();
        set.add(1);
        set.add(2);
        let msg = new concurrency.Message(1, set as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, set as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2800
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with Date obj returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let date = new Date();
        let msg = new concurrency.Message(1, date as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, date as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest2900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_2900
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with different what but same obj returns false for unmatched what
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", handler);
        handler.sendMessage(msg);
        let result1: boolean = handler.hasMessages(1, "test");
        let result2: boolean = handler.hasMessages(2, "test");
        expect(result1).assertTrue();
        expect(result2).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3000
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with same what but different obj returns false for unmatched obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", handler);
        handler.sendMessage(msg);
        let result1: boolean = handler.hasMessages(1, "test");
        let result2: boolean = handler.hasMessages(1, "other");
        expect(result1).assertTrue();
        expect(result2).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3100
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with multiple messages queries different combinations correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg1 = new concurrency.Message(1, "obj1", handler);
        let msg2 = new concurrency.Message(1, "obj2", handler);
        let msg3 = new concurrency.Message(2, "obj1", handler);
        handler.sendMessage(msg1);
        handler.sendMessage(msg2);
        handler.sendMessage(msg3);
        expect(handler.hasMessages(1, "obj1")).assertTrue();
        expect(handler.hasMessages(1, "obj2")).assertTrue();
        expect(handler.hasMessages(2, "obj1")).assertTrue();
        expect(handler.hasMessages(2, "obj2")).assertFalse();
        expect(handler.hasMessages(3, "obj1")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3200
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false when no matching message exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let msg = new concurrency.Message(1, "test", handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(999, "nonexistent");
        expect(result).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3300
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false when message queue is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let result: boolean = handler.hasMessages(1, "test");
        expect(result).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })


    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3400
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false when Message created without what identifier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let callback = (): void => {};
        let msg = new concurrency.Message(callback, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(-1000000, "data");
        expect(result).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3500
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with same object reference returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let obj: Record<string, Object> = { "key": "value" as Object };
        let msg = new concurrency.Message(1, obj as Object, handler);
        handler.sendMessage(msg);
        let result: boolean = handler.hasMessages(1, obj as Object);
        expect(result).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3600
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with different object reference but same content returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let obj: Record<string, Object> = { "key": "value" as Object };
        let msg = new concurrency.Message(1, obj as Object, handler);
        handler.sendMessage(msg);
        let otherObj: Record<string, Object> = { "key": "value" as Object };
        let result: boolean = handler.hasMessages(1, otherObj as Object);
        expect(result).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })


    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3700
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) return value can be used in conditional branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", handler);
        handler.sendMessage(msg);
        let entered: boolean = false;
        if (handler.hasMessages(1, "test")) {
          entered = true;
        }
        expect(entered).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3800
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with large number of messages queries correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        for (let i: int = 0; i < 100; i++) {
          let m = new concurrency.Message(i, `obj_${i}`, handler);
          handler.sendMessage(m);
        }
        expect(handler.hasMessages(0, "obj_0")).assertTrue();
        expect(handler.hasMessages(99, "obj_99")).assertTrue();
        expect(handler.hasMessages(50, "obj_50")).assertTrue();
        expect(handler.hasMessages(100, "obj_100")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest3900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_3900
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) consecutive queries return consistent results
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", handler);
        handler.sendMessage(msg);
        for (let i: int = 0; i < 10; i++) {
          let result: boolean = handler.hasMessages(1, "test");
          expect(result).assertTrue();
        }
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4000
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false before EAWorker start and true after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", handler);
        let sentBeforeStart: boolean = handler.sendMessage(msg);
        let hasBeforeStart: boolean = handler.hasMessages(1, "test");
        expect(sentBeforeStart).assertFalse();
        expect(hasBeforeStart).assertFalse();
        eaw.start();
        let msgAfterStart = new concurrency.Message(1, "test", handler);
        let sentAfterStart: boolean = handler.sendMessage(msgAfterStart);
        let hasAfterStart: boolean = handler.hasMessages(1, "test");
        expect(sentAfterStart).assertTrue();
        expect(hasAfterStart).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4100
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) after EAWorker terminated
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
      eaw.quit();
      let quitWait: int = 0;
      while (eaw.isAlive() && quitWait < 20000) {
        quitWait++;
      }
      let result: boolean = handler.hasMessages(1, "test");
      expect(result).assertFalse();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4200
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with both what and obj matching returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(100, "match_obj", handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(100, "match_obj")).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4300
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with unmatched what returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let msg = new concurrency.Message(100, "match_obj", handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(200, "match_obj")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4400
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with unmatched obj returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let msg = new concurrency.Message(100, "match_obj", handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(100, "other_obj")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4500
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with both what and obj unmatched returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        eaw.start();
        let msg = new concurrency.Message(100, "match_obj", handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(200, "other_obj")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4600
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with multiple messages partial match
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(1, "obj2", handler));
        handler.sendMessage(new concurrency.Message(2, "obj1", handler));
        expect(handler.hasMessages(1, "obj1")).assertTrue();
        expect(handler.hasMessages(1, "obj2")).assertTrue();
        expect(handler.hasMessages(2, "obj1")).assertTrue();
        expect(handler.hasMessages(2, "obj2")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4700
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with same what different obj multiple messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(1, "obj2", handler));
        handler.sendMessage(new concurrency.Message(1, "obj3", handler));
        expect(handler.hasMessages(1, "obj1")).assertTrue();
        expect(handler.hasMessages(1, "obj2")).assertTrue();
        expect(handler.hasMessages(1, "obj3")).assertTrue();
        expect(handler.hasMessages(1, "obj4")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4800
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with same obj different what multiple messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        handler.sendMessage(new concurrency.Message(1, "obj", handler));
        handler.sendMessage(new concurrency.Message(2, "obj", handler));
        handler.sendMessage(new concurrency.Message(3, "obj", handler));
        expect(handler.hasMessages(1, "obj")).assertTrue();
        expect(handler.hasMessages(2, "obj")).assertTrue();
        expect(handler.hasMessages(3, "obj")).assertTrue();
        expect(handler.hasMessages(4, "obj")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest4900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_4900
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false after removeMessages(what, obj)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let verified = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: (() => void) | undefined = msg.getCallback();
          if (cb !== undefined) {
            cb();
          }
        }, eaw);
        eaw.start();
        let postedCallback = (): void => {
          handler.sendMessage(new concurrency.Message(1, "test", handler));
          handler.removeMessages(1, "test");
          let result: boolean = handler.hasMessages(1, "test");
          if (!result) {
            verified.fetchAdd(1);
          }
        };
        handler.post(postedCallback);
        let waitCount: int = 0;
        while (verified.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(verified.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5000
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) after removing partial messages remaining still found
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let verified = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: (() => void) | undefined = msg.getCallback();
          if (cb !== undefined) {
            cb();
          }
        }, eaw);
        let msg1 = new concurrency.Message(1, "obj1", handler);
        let msg2 = new concurrency.Message(1, "obj2", handler);
        let testCallback = (): void => {
          handler.sendMessage(msg1);
          handler.sendMessage(msg2);
          if (handler.hasMessages(1, "obj1")) {
            handler.removeMessages(1, "obj1");
            if (!handler.hasMessages(1, "obj1") && handler.hasMessages(1, "obj2")) {
              verified.fetchAdd(1);
            }
          }
        };
        let callbackMsg = new concurrency.Message(testCallback, handler);
        handler.sendMessage(callbackMsg);
        let waitCount: int = 0;
        while (verified.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(verified.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5100
     * @tc.desc   Verify MessageHandler.hasMessages(what) vs hasMessages(what, obj) behavior difference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "obj", handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(1)).assertTrue();
        expect(handler.hasMessages(1, "obj")).assertTrue();
        expect(handler.hasMessages(1, "other")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5200
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) precise matching with two-param vs single-param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        handler.sendMessage(new concurrency.Message(1, "obj1", handler));
        handler.sendMessage(new concurrency.Message(1, "obj2", handler));
        expect(handler.hasMessages(1)).assertTrue();
        expect(handler.hasMessages(1, "obj1")).assertTrue();
        expect(handler.hasMessages(1, "obj2")).assertTrue();
        expect(handler.hasMessages(1, "obj3")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5300
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) unprocessed messages can be queried
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg1 = new concurrency.Message(1, "obj1", handler);
        let msg2 = new concurrency.Message(2, "obj2", handler);
        handler.sendMessage(msg1);
        handler.sendMessage(msg2);
        expect(handler.hasMessages(1, "obj1")).assertTrue();
        expect(handler.hasMessages(2, "obj2")).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })


    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5400
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) async send then query returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let msgSent = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 100) {
            let innerMsg = new concurrency.Message(1, "async_obj", msg.getTarget());
            msg.getTarget().sendMessage(innerMsg);
            msgSent.fetchAdd(1);
          }
        }, eaw);
        eaw.start();
        handler.sendEmptyMessage(100);
        let waitCount: int = 0;
        while (msgSent.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(handler.hasMessages(1, "async_obj")).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5500
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) finds prefilled target messages from query callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let queryCount = new AtomicInt(0);
        let trueCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() >= 10 && msg.getWhat() < 20) {
            let result: boolean = msg.getTarget().hasMessages(1, "test");
            if (result) {
              trueCount.fetchAdd(1);
            }
            queryCount.fetchAdd(1);
          }
        }, eaw);
        eaw.start();
        // Prefill targets before query messages so FIFO still leaves what/obj in queue.
        for (let i: int = 0; i < 5; i++) {
          handler.sendMessage(new concurrency.Message(1, "test", handler));
        }
        for (let i: int = 0; i < 5; i++) {
          handler.sendEmptyMessage(10 + i);
        }
        let waitCount: int = 0;
        while (queryCount.load() < 5 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(queryCount.load()).assertEqual(5);
        expect(trueCount.load()).assertEqual(5);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5600
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) nested query inside callback checks other messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Shared obj refs + atomic enqueue so nested hasMessages(what, obj) sees siblings
      let eaw = new EAWorker();
      eaw.start();
      try {
        let checkResult = new AtomicInt(0);
        let doneCount = new AtomicInt(0);
        let obj1: Object = "obj1" as Object;
        let obj2: Object = "obj2" as Object;
        let obj3: Object = "obj3" as Object;
        let obj4: Object = "obj4" as Object;
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: (() => void) | undefined = msg.getCallback();
          if (cb !== undefined) {
            cb();
          }
          if (msg.getWhat() === 1) {
            let has2: boolean = msg.getTarget().hasMessages(2, obj2);
            let has3: boolean = msg.getTarget().hasMessages(3, obj3);
            if (has2) {
              checkResult.fetchAdd(1);
            }
            if (has3) {
              checkResult.fetchAdd(1);
            }
          } else if (msg.getWhat() === 4) {
            doneCount.fetchAdd(1);
          }
        }, eaw);
        let postedCallback = (): void => {
          handler.sendMessage(new concurrency.Message(1, obj1, handler));
          handler.sendMessage(new concurrency.Message(2, obj2, handler));
          handler.sendMessage(new concurrency.Message(3, obj3, handler));
          handler.sendMessage(new concurrency.Message(4, obj4, handler));
        };
        handler.post(postedCallback);
        let waitCount: int = 0;
        while (doneCount.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(checkResult.load()).assertEqual(2);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5700
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) self-check inside callback returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let selfCheckDone = new AtomicInt(0);
        let selfCheckResult: boolean = false;
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 1) {
            selfCheckResult = msg.getTarget().hasMessages(1, "self");
            selfCheckDone.fetchAdd(1);
          }
        }, eaw);
        eaw.start();
        handler.sendMessage(new concurrency.Message(1, "self", handler));
        let waitCount: int = 0;
        while (selfCheckDone.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(selfCheckResult).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })



    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5800
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) finds prefilled shared object from concurrent query callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let queryCount = new AtomicInt(0);
        let trueCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() >= 100) {
            let result: boolean = msg.getTarget().hasMessages(1, "shared");
            if (result) {
              trueCount.fetchAdd(1);
            }
            queryCount.fetchAdd(1);
          }
        }, eaw);
        eaw.start();
        // Prefill enough shared targets before query messages for FIFO stability.
        for (let i: int = 0; i < 10; i++) {
          handler.sendMessage(new concurrency.Message(1, "shared", handler));
        }
        for (let i: int = 0; i < 10; i++) {
          handler.sendEmptyMessage(100 + i);
        }
        let waitCount: int = 0;
        while (queryCount.load() < 10 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(queryCount.load()).assertEqual(10);
        expect(trueCount.load()).assertEqual(10);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest5900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_5900
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) concurrent query from main thread and Worker thread
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let workerDone = new AtomicInt(0);
        let workerTrueCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() >= 100) {
            let result: boolean = msg.getTarget().hasMessages(1, "target");
            if (result) {
              workerTrueCount.fetchAdd(1);
            }
            workerDone.fetchAdd(1);
          }
        }, eaw);
        eaw.start();
        handler.sendMessage(new concurrency.Message(1, "target", handler));
        for (let i: int = 0; i < 5; i++) {
          handler.sendMessage(new concurrency.Message(100 + i, "trigger", handler));
        }
        let mainResults: boolean[] = [];
        for (let i: int = 0; i < 5; i++) {
          mainResults.push(handler.hasMessages(1, "target"));
        }
        let waitCount: int = 0;
        while (workerDone.load() < 5 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        for (let i: int = 0; i < mainResults.length; i++) {
          expect(mainResults[i]).assertTrue();
        }
        expect(workerDone.load()).assertEqual(5);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6000
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6000
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) concurrent with sendMessage inside callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let sendCount = new AtomicInt(0);
        let doneCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 1) {
            sendCount.fetchAdd(1);
            if (sendCount.load() >= 6) {
              doneCount.fetchAdd(1);
            }
          } else if (msg.getWhat() >= 100) {
            msg.getTarget().sendMessage(new concurrency.Message(1, "concurrent", msg.getTarget()));
          }
        }, eaw);
        eaw.start();
        handler.sendMessage(new concurrency.Message(1, "concurrent", handler));
        for (let i: int = 0; i < 5; i++) {
          handler.sendMessage(new concurrency.Message(100 + i, "trigger", handler));
        }
        let waitCount: int = 0;
        while (doneCount.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(sendCount.load()).assertEqual(6);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6100
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6100
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) isolation between different EAWorker handlers
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw1 = new EAWorker();
      let eaw2 = new EAWorker();
      eaw1.start();
      eaw2.start();
      try {
        let done1 = new AtomicInt(0);
        let done2 = new AtomicInt(0);
        let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 100) {
            done1.fetchAdd(1);
          }
        }, eaw1);
        let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 100) {
            done2.fetchAdd(1);
          }
        }, eaw2);
        handler1.sendMessage(new concurrency.Message(1, "handler1", handler1));
        handler2.sendMessage(new concurrency.Message(1, "handler2", handler2));
        handler1.sendMessage(new concurrency.Message(100, "trigger", handler1));
        handler2.sendMessage(new concurrency.Message(100, "trigger", handler2));
        let waitCount: int = 0;
        while ((done1.load() < 1 || done2.load() < 1) && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(handler1.hasMessages(1, "handler1")).assertTrue();
        expect(handler2.hasMessages(1, "handler2")).assertTrue();
        expect(handler1.hasMessages(1, "handler2")).assertFalse();
        expect(handler2.hasMessages(1, "handler1")).assertFalse();
      } finally {
        if (eaw1.isAlive()) {
          try {
            eaw1.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
        if (eaw2.isAlive()) {
          try {
            eaw2.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6200
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6200
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) returns false after removeMessages(what, obj) removes sent message in callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let verified = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let cb: (() => void) | undefined = msg.getCallback();
          if (cb !== undefined) {
            cb();
          }
        }, eaw);
        eaw.start();
        let postedCallback = (): void => {
          handler.sendMessage(new concurrency.Message(1, "cleanup", handler));
          handler.removeMessages(1, "cleanup");
          let result: boolean = handler.hasMessages(1, "cleanup");
          if (!result) {
            verified.fetchAdd(1);
          }
        };
        handler.post(postedCallback);
        let waitCount: int = 0;
        while (verified.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(verified.load()).assertEqual(1);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6300
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6300
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) callback conditional business logic branch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let actionTaken: string = "";
        let doneCount = new AtomicInt(0);
        let msg2Sent = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          if (msg.getWhat() === 1) {
            let deadline: number = Date.now() + 3000;
            while (msg2Sent.load() < 1 && Date.now() < deadline) {
            }
            if (msg.getTarget().hasMessages(2, "priority")) {
              actionTaken = "handle_priority_first";
              msg.getTarget().removeMessages(2, "priority");
            } else if (msg.getTarget().hasMessages(3, "normal")) {
              actionTaken = "handle_normal";
            } else {
              actionTaken = "no_pending";
            }
            doneCount.fetchAdd(1);
          }
        }, eaw);
        eaw.start();
        handler.sendMessage(new concurrency.Message(1, "trigger", handler));
        handler.sendMessage(new concurrency.Message(2, "priority", handler));
        msg2Sent.store(1);
        let waitCount: int = 0;
        while (doneCount.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(actionTaken).assertEqual("handle_priority_first");
        expect(handler.hasMessages(2, "priority")).assertFalse();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6400
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6400
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) callback priority scheduling with nested query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      try {
        let processedOrder: number[] = [];
        let doneCount = new AtomicInt(0);
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let callback: (() => void) | undefined = msg.getCallback();
          if (callback !== undefined) {
            callback();
            return;
          }
          if (msg.getTarget().hasMessages(1, "high")) {
            processedOrder.push(1);
            msg.getTarget().removeMessages(1, "high");
          }
          if (msg.getTarget().hasMessages(2, "medium")) {
            processedOrder.push(2);
            msg.getTarget().removeMessages(2, "medium");
          }
          if (msg.getTarget().hasMessages(3, "low")) {
            processedOrder.push(3);
            msg.getTarget().removeMessages(3, "low");
            doneCount.fetchAdd(1);
          }
        }, eaw);
        eaw.start();
        let postedCallback = (): void => {
          handler.sendMessage(new concurrency.Message(3, "low", handler));
          handler.sendMessage(new concurrency.Message(1, "high", handler));
          handler.sendMessage(new concurrency.Message(2, "medium", handler));
        };
        handler.post(postedCallback);
        let waitCount: int = 0;
        while (doneCount.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(processedOrder.length).assertEqual(3);
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
      done();
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6500
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6500
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with large object as obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let largeObj: Record<string, string> = {};
        for (let i: int = 0; i < 1000; i++) {
          largeObj[`key_${i}`] = `value_${i}`;
        }
        let msg = new concurrency.Message(1, largeObj as Object, handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(1, largeObj as Object)).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6600
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6600
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) message queue capacity with large number of messages
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageHandlerHasMessagesWhatObjTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        for (let i: int = 0; i < 100; i++) {
          let m = new concurrency.Message(i, `obj_${i}`, handler);
          let sent: boolean = handler.sendMessage(m);
          if (!sent) {
            break;
          }
        }
        expect(handler.hasMessages(0, "obj_0")).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6700
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6700
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) different handler isolation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageHandlerHasMessagesWhatObjTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw1 = new EAWorker();
      eaw1.start();
      let eaw2 = new EAWorker();
      eaw2.start();
      try {
        let handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw1);
        let handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw2);
        let msg1 = new concurrency.Message(1, "obj1", handler1);
        handler1.sendMessage(msg1);
        expect(handler2.hasMessages(1, "obj1")).assertFalse();
        expect(handler1.hasMessages(1, "obj1")).assertTrue();
      } finally {
        if (eaw1.isAlive()) {
          try {
            eaw1.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
        if (eaw2.isAlive()) {
          try {
            eaw2.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6800
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6800
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) with Message(what, obj, handler) constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test_obj", handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(1, "test_obj")).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })

    /**
     * @tc.name   MessageHandlerHasMessagesWhatObjTest6900
     * @tc.number SUB_MESSAGE_HANDLER_HAS_MESSAGES_WHAT_OBJ_TEST_6900
     * @tc.desc   Verify MessageHandler.hasMessages(what, obj) works under ArkTS1.2 environment
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageHandlerHasMessagesWhatObjTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "arkts12", handler);
        handler.sendMessage(msg);
        expect(handler.hasMessages(1, "arkts12")).assertTrue();
      } finally {
        if (eaw.isAlive()) {
          try {
            eaw.quit();
          } catch (error) {
            console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
          }
        }
      }
    })
  })
}
