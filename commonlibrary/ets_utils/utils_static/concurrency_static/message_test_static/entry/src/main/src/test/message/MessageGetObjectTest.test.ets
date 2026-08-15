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

type ObjFunc = () => string

class GetObjectTestData {
  name: string = ""
  value: number = 0
}

class GetObjectStructData {
  id: number = 0
  name: string = ""
  items: string[] = []
}

class GetObjectCircularData {
  name: string = ""
  self: GetObjectCircularData | null = null
}

class GetObjectDeepLevel3Data {
  value: string = ""
}

class GetObjectDeepLevel2Data {
  level3: GetObjectDeepLevel3Data = new GetObjectDeepLevel3Data()
}

class GetObjectDeepLevel1Data {
  level2: GetObjectDeepLevel2Data = new GetObjectDeepLevel2Data()
}

class GetObjectDeepData {
  level1: GetObjectDeepLevel1Data = new GetObjectDeepLevel1Data()
}

export default function MessageGetObjectTest(): void {
  describe('MessageGetObjectTest', (): void => {
    beforeAll((): void => {
    })
    beforeEach((): void => {
    })
    afterEach((): void => {
    })
    afterAll((): void => {
    })


    /**
     * @tc.name   MessageGetObjectTest0100
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0100
     * @tc.desc   Verify Message.getObject() with no args returns obj from constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let StringMessage: int = 2;
        let msg = new concurrency.Message(StringMessage, "hello", messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual("hello");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest0200
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0200
     * @tc.desc   Verify Message.getObject() ignores extra arguments and returns correct obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "data", messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual("data");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest0300
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0300
     * @tc.desc   Verify Message.getObject() returns string object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let StringMessage: int = 2;
        let msg = new concurrency.Message(StringMessage, "hello world", messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual("hello world");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest0400
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0400
     * @tc.desc   Verify Message.getObject() returns number object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, 12345, messageHandler);
        let obj: int = msg.getObject() as int;
        expect(obj).assertEqual(12345);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest0500
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0500
     * @tc.desc   Verify Message.getObject() returns boolean true object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, true, messageHandler);
        let obj: boolean = msg.getObject() as boolean;
        expect(obj).assertEqual(true);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest0600
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0600
     * @tc.desc   Verify Message.getObject() returns array object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let arr: number[] = [1, 2, 3];
        let msg = new concurrency.Message(1, arr, messageHandler);
        let obj = msg.getObject() as number[];
        expect(obj.length).assertEqual(3);
        expect(obj[0]).assertEqual(1);
        expect(obj[1]).assertEqual(2);
        expect(obj[2]).assertEqual(3);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest0700
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0700
     * @tc.desc   Verify Message.getObject() returns class instance object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let data: GetObjectTestData = new GetObjectTestData();
        data.name = "test";
        data.value = 123;
        let msg = new concurrency.Message(1, data, messageHandler);
        let obj = msg.getObject() as GetObjectTestData;
        expect(obj.name).assertEqual("test");
        expect(obj.value).assertEqual(123);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest0800
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0800
     * @tc.desc   Verify Message.getObject() returns Map object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let map: Map<string, number> = new Map<string, number>();
        map.set("key1", 100);
        let msg = new concurrency.Message(1, map, messageHandler);
        let obj = msg.getObject() as Map<string, number>;
        expect(obj.get("key1")).assertEqual(100);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest0900
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_0900
     * @tc.desc   Verify Message.getObject() returns Set object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let set: Set<number> = new Set<number>([1, 2, 3]);
        let msg = new concurrency.Message(1, set, messageHandler);
        let obj = msg.getObject() as Set<number>;
        expect(obj.has(1)).assertTrue();
        expect(obj.size).assertEqual(3);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1000
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1000
     * @tc.desc   Verify Message.getObject() returns ArrayBuffer object correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let buffer: ArrayBuffer = new ArrayBuffer(1024);
        let msg = new concurrency.Message(1, buffer, messageHandler);
        let obj = msg.getObject() as ArrayBuffer;
        expect(obj.byteLength).assertEqual(1024);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1100
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1100
     * @tc.desc   Verify Message.getObject() returns function object with reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let func: ObjFunc = (): string => "result";
        let msg = new concurrency.Message(1, func, messageHandler);
        let obj = msg.getObject();
        expect(obj === func).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest1200
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1200
     * @tc.desc   Verify Message.getObject() returns undefined when using constructor(handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(messageHandler);
        let obj = msg.getObject();
        expect(obj === undefined).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1300
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1300
     * @tc.desc   Verify Message.getObject() returns undefined when using constructor(what, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let EmptyMessage: int = 1;
        let msg = new concurrency.Message(EmptyMessage, messageHandler);
        let obj = msg.getObject();
        expect(obj === undefined).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1400
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1400
     * @tc.desc   Verify Message.getObject() returns undefined when using constructor(callback, handler)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: () => void = (): void => { console.info("callback"); }
        let msg = new concurrency.Message(callback, messageHandler);
        let obj = msg.getObject();
        expect(obj === undefined).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1500
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1500
     * @tc.desc   Verify Message.getObject() returns empty string correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "", messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual("");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1600
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1600
     * @tc.desc   Verify Message.getObject() returns empty array correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let emptyArr: number[] = [];
        let msg = new concurrency.Message(1, emptyArr, messageHandler);
        let obj = msg.getObject() as number[];
        expect(obj.length).assertEqual(0);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1700
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1700
     * @tc.desc   Verify Message.getObject() returns zero value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, 0, messageHandler);
        let obj: int = msg.getObject() as int;
        expect(obj).assertEqual(0);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest1800
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1800
     * @tc.desc   Verify Message.getObject() returns boolean false value correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, false, messageHandler);
        let obj: boolean = msg.getObject() as boolean;
        expect(obj).assertEqual(false);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest1900
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_1900
     * @tc.desc   Verify Message.getObject() return value is not undefined for obj-carrying message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", messageHandler);
        let obj = msg.getObject();
        expect(obj !== undefined).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2000
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2000
     * @tc.desc   Verify Message.getObject() returned Map passes instanceof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let map: Map<string, number> = new Map<string, number>();
        let msg = new concurrency.Message(1, map, messageHandler);
        let obj = msg.getObject();
        expect(obj instanceof Map).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2100
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2100
     * @tc.desc   Verify Message.getObject() returned Set passes instanceof check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let set: Set<number> = new Set<number>();
        let msg = new concurrency.Message(2, set, messageHandler);
        let obj = msg.getObject();
        expect(obj instanceof Set).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2200
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2200
     * @tc.desc   Verify Message.getObject() returned array passes Array.isArray check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let arr: number[] = [1, 2, 3];
        let msg = new concurrency.Message(3, arr, messageHandler);
        let obj = msg.getObject();
        expect(Array.isArray(obj)).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2300
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2300
     * @tc.desc   Verify Message.getObject() returned class instance preserves structure integrity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let data: GetObjectStructData = new GetObjectStructData();
        data.id = 1;
        data.name = "test";
        data.items = ["a", "b"];
        let msg = new concurrency.Message(1, data, messageHandler);
        let obj = msg.getObject() as GetObjectStructData;
        expect(obj.id).assertEqual(1);
        expect(obj.name).assertEqual("test");
        expect(obj.items.length).assertEqual(2);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest2400
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2400
     * @tc.desc   Verify Message.getObject() returns large string correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let longStr: string = "a".repeat(10240);
        let msg = new concurrency.Message(1, longStr, messageHandler);
        let obj = msg.getObject() as string;
        expect(obj.length).assertEqual(10240);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2500
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2500
     * @tc.desc   Verify Message.getObject() returns large array correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let largeArr: number[] = [];
        for (let i = 0; i < 1000; i++) {
          largeArr.push(0);
        }
        let msg = new concurrency.Message(1, largeArr, messageHandler);
        let obj = msg.getObject() as number[];
        expect(obj.length).assertEqual(1000);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2600
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2600
     * @tc.desc   Verify Message.getObject() returns Number.MAX_VALUE correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, Number.MAX_VALUE, messageHandler);
        let obj: number = msg.getObject() as number;
        expect(obj).assertEqual(Number.MAX_VALUE);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2700
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2700
     * @tc.desc   Verify Message.getObject() returns Number.MIN_VALUE correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, Number.MIN_VALUE, messageHandler);
        let obj: number = msg.getObject() as number;
        expect(obj).assertEqual(Number.MIN_VALUE);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2800
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2800
     * @tc.desc   Verify Message.getObject() returns Infinity correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, Infinity, messageHandler);
        let obj: number = msg.getObject() as number;
        expect(obj).assertEqual(Infinity);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest2900
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_2900
     * @tc.desc   Verify Message.getObject() returns negative Infinity correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(2, -Infinity, messageHandler);
        let obj: number = msg.getObject() as number;
        expect(obj).assertEqual(-Infinity);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest3000
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3000
     * @tc.desc   Verify Message.getObject() returns NaN correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(3, NaN, messageHandler);
        let obj = msg.getObject();
        expect(Number.isNaN(obj as number)).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest3100
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3100
     * @tc.desc   Verify Message.getObject() returns Chinese Unicode string correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "中文测试", messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual("中文测试");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest3200
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3200
     * @tc.desc   Verify Message.getObject() returns Emoji Unicode string correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(2, "🎉🚀💻", messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual("🎉🚀💻");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest3300
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3300
     * @tc.desc   Verify Message.getObject() returns special Unicode characters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let specialStr: string = "\u200B\u200C\u200D";
        let msg = new concurrency.Message(3, specialStr, messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual(specialStr);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest3400
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3400
     * @tc.desc   Verify Message.getObject() does not throw exception in normal usage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual("test");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest3500
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3500
     * @tc.desc   Verify Message.getObject() with type assertion as string works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "hello", messageHandler);
        let obj = msg.getObject() as string;
        expect(obj.toUpperCase()).assertEqual("HELLO");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest3600
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3600
     * @tc.desc   Verify Message.getObject() result compared directly with expected string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test", messageHandler);
        let obj = msg.getObject();
        expect(obj === "test").assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest3700
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3700
     * @tc.desc   Verify Message.getObject() returns correct obj after sendToTarget in MessageHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let receivedCounter: AtomicInt = new AtomicInt(0);
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let obj = msg.getObject();
          if (obj === "worker data") {
            receivedCounter.fetchAdd(1);
          }
        }, eaw);
        let msg = new concurrency.Message(1, "worker data", messageHandler);
        msg.sendToTarget();
        let waitCount = 0;
        while (receivedCounter.load() < 1 && waitCount < 50) {
          waitCount++;
          await Utils.msSleep(100);
        }
        expect(receivedCounter.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageGetObjectTest3800
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3800
     * @tc.desc   Verify Message.getObject() returns consistent value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "test data", messageHandler);
        let obj1: string = msg.getObject() as string;
        let obj2: string = msg.getObject() as string;
        let obj3: string = msg.getObject() as string;
        expect(obj1).assertEqual(obj2);
        expect(obj2).assertEqual(obj3);
        expect(obj1).assertEqual("test data");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest3900
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_3900
     * @tc.desc   Verify Message.getObject() inside MessageHandler callback returns correct obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let callbackCounter: AtomicInt = new AtomicInt(0);
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
          let obj = msg.getObject();
          if (obj === "test object") {
            callbackCounter.fetchAdd(1);
          }
        }, eaw);
        let msg = new concurrency.Message(1, "test object", messageHandler);
        msg.sendToTarget();
        let waitCount = 0;
        while (callbackCounter.load() < 1 && waitCount < 50) {
          waitCount++;
          try {
            await Utils.msSleep(100);
          } catch (error) {
            expect(error).assertFail();
          }
        }
        expect(callbackCounter.load()).assertEqual(1);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })

    /**
     * @tc.name   MessageGetObjectTest4000
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4000
     * @tc.desc   Verify Message.getObject() with multiple Message instances returns correct obj for each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg1 = new concurrency.Message(1, "data1", messageHandler);
        let msg2 = new concurrency.Message(2, "data2", messageHandler);
        let msg3 = new concurrency.Message(3, "data3", messageHandler);
        let obj1: string = msg1.getObject() as string;
        let obj2: string = msg2.getObject() as string;
        let obj3: string = msg3.getObject() as string;
        expect(obj1).assertEqual("data1");
        expect(obj2).assertEqual("data2");
        expect(obj3).assertEqual("data3");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest4100
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4100
     * @tc.desc   Verify Message.getObject() sequential reads of two message objects are counted correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let data: GetObjectTestData = new GetObjectTestData();
        data.name = "test";
        data.value = 42;
        let msg = new concurrency.Message(1, data, messageHandler);
        let counter: AtomicInt = new AtomicInt(0);
        try {
          await Promise.all([
            (async (): Promise<void> => {
              let obj = msg.getObject() as GetObjectTestData;
              if (obj.name === "test") {
                counter.fetchAdd(1);
              }
            })(),
            (async (): Promise<void> => {
              let obj = msg.getObject() as GetObjectTestData;
              if (obj.value === 42) {
                counter.fetchAdd(1);
              }
            })()
          ]);
        } catch (error) {
          expect(error).assertFail();
        }
        expect(counter.load()).assertEqual(2);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
      done();
    })


    /**
     * @tc.name   MessageGetObjectTest4200
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4200
     * @tc.desc   Verify Message.getObject() combined with getWhat() returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let StringMessage: int = 2;
        let msg = new concurrency.Message(StringMessage, "hello", messageHandler);
        let what: int = msg.getWhat();
        let obj: string = msg.getObject() as string;
        expect(what).assertEqual(2);
        expect(obj).assertEqual("hello");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest4300
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4300
     * @tc.desc   Verify Message.getObject() returns undefined when callback constructor is used
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let callback: () => void = (): void => { console.info("callback"); }
        let msg = new concurrency.Message(callback, messageHandler);
        let cb = msg.getCallback();
        let obj = msg.getObject();
        expect(cb !== undefined).assertTrue();
        expect(obj === undefined).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest4400
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4400
     * @tc.desc   Verify Message.getObject() combined with getTarget() returns correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "data", messageHandler);
        let target = msg.getTarget();
        let obj: string = msg.getObject() as string;
        expect(target === messageHandler).assertTrue();
        expect(obj).assertEqual("data");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest4500
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4500
     * @tc.desc   Verify Message.getObject() with equals() when two messages have same obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg1 = new concurrency.Message(1, "hello", messageHandler);
        let msg2 = new concurrency.Message(1, "hello", messageHandler);
        let obj1: string = msg1.getObject() as string;
        let obj2: string = msg2.getObject() as string;
        expect(obj1).assertEqual(obj2);
        expect(msg1.equals(msg2)).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest4600
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4600
     * @tc.desc   Verify Message.getObject() with equals() when two messages have different obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg1 = new concurrency.Message(1, "hello", messageHandler);
        let msg2 = new concurrency.Message(1, "world", messageHandler);
        let obj1 = msg1.getObject();
        let obj2 = msg2.getObject();
        expect(obj1 !== obj2).assertTrue();
        expect(msg1.equals(msg2)).assertFalse();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest4700
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4700
     * @tc.desc   Verify Message.getObject() behavior across four different constructors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MessageGetObjectTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        // Constructor1: handler only
        let msg1 = new concurrency.Message(messageHandler);
        expect(msg1.getObject() === undefined).assertTrue();
        // Constructor2: what + handler
        let msg2 = new concurrency.Message(1, messageHandler);
        expect(msg2.getObject() === undefined).assertTrue();
        // Constructor3: what + obj + handler
        let msg3 = new concurrency.Message(1, "data", messageHandler);
        expect(msg3.getObject() as string).assertEqual("data");
        // Constructor4: callback + handler
        let callback: () => void = (): void => {}
        let msg4 = new concurrency.Message(callback, messageHandler);
        expect(msg4.getObject() === undefined).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest4800
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4800
     * @tc.desc   Verify Message.getObject() returns same reference on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let data: GetObjectTestData = new GetObjectTestData();
        data.name = "test";
        let msg = new concurrency.Message(1, data, messageHandler);
        let obj1 = msg.getObject();
        let obj2 = msg.getObject();
        expect(obj1 === obj2).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest4900
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_4900
     * @tc.desc   Verify Message.getObject() string type is immutable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, "hello", messageHandler);
        let obj = msg.getObject() as string;
        let upperObj: string = obj.toUpperCase();
        expect(obj).assertEqual("hello");
        expect(upperObj).assertEqual("HELLO");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5000
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5000
     * @tc.desc   Verify Message.getObject() number object round-trip returns original value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, 123, messageHandler);
        let obj: int = msg.getObject() as int;
        expect(obj).assertEqual(123);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })


    /**
     * @tc.name   MessageGetObjectTest5100
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5100
     * @tc.desc   Verify Message.getObject() returns XSS string safely without execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageGetObjectTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let xssStr: string = "<script>alert('xss')</script>";
        let msg = new concurrency.Message(1, xssStr, messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual(xssStr);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5200
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5200
     * @tc.desc   Verify Message.getObject() returns string with zero-width space characters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageGetObjectTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let zeroWidthStr: string = "\u200B\u200C\u200D";
        let msg = new concurrency.Message(1, zeroWidthStr, messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual(zeroWidthStr);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5300
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5300
     * @tc.desc   Verify Message.getObject() returns string with newline and tab characters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageGetObjectTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let newlineTabStr: string = "line1\nline2\ttab";
        let msg = new concurrency.Message(2, newlineTabStr, messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual(newlineTabStr);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5400
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5400
     * @tc.desc   Verify Message.getObject() returns string with escape characters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('MessageGetObjectTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let escapeStr: string = "quote\"backslash\\";
        let msg = new concurrency.Message(3, escapeStr, messageHandler);
        let obj: string = msg.getObject() as string;
        expect(obj).assertEqual(escapeStr);
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5500
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5500
     * @tc.desc   Verify Message.getObject() returns null when null is carried as obj
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MessageGetObjectTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let msg = new concurrency.Message(1, null, messageHandler);
        let obj = msg.getObject();
        expect(obj === null).assertTrue();
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5600
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5600
     * @tc.desc   Verify Message.getObject() returns object with many properties correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let largeObj: Record<string, string> = {};
        for (let i: int = 0; i < 1000; i++) {
          largeObj[`key_${i}`] = `value_${i}`;
        }
        let msg = new concurrency.Message(1, largeObj, messageHandler);
        let obj = msg.getObject() as Record<string, string>;
        expect(obj === largeObj).assertTrue();
        expect(obj["key_0"]).assertEqual("value_0");
        expect(obj["key_999"]).assertEqual("value_999");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5700
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5700
     * @tc.desc   Verify Message.getObject() returns circular reference object preserving self reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let circularObj = new GetObjectCircularData();
        circularObj.name = "test";
        circularObj.self = circularObj;
        let msg = new concurrency.Message(1, circularObj, messageHandler);
        let obj = msg.getObject() as GetObjectCircularData;
        expect(obj.name).assertEqual("test");
        expect(obj.self !== null).assertTrue();
        expect(obj.self!.name).assertEqual("test");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })

    /**
     * @tc.name   MessageGetObjectTest5800
     * @tc.number SUB_MESSAGE_GET_OBJECT_TEST_5800
     * @tc.desc   Verify Message.getObject() returns deeply nested object preserving nested value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MessageGetObjectTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let eaw = new EAWorker();
      eaw.start();
      try {
        let messageHandler = new concurrency.MessageHandler((msg: concurrency.Message): void => {}, eaw);
        let deepObj = new GetObjectDeepData();
        deepObj.level1.level2.level3.value = "deep";
        let msg = new concurrency.Message(1, deepObj, messageHandler);
        let obj = msg.getObject() as GetObjectDeepData;
        expect(obj.level1.level2.level3.value).assertEqual("deep");
      } finally {
        try {
          if (eaw.isAlive()) { eaw.quit(); }
        } catch (error) {
          console.warn(`Failed to quit EAWorker: ${JSON.stringify(error)}`);
        }
      }
    })
  })
}
