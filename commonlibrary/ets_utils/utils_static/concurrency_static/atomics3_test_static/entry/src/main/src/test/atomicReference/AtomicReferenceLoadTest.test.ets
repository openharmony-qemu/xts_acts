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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

class Container {
  public value: int = 1;
}

class MyClass {
  public name: string = "test";
  public age: int = 25;
}

class LargeClass {
  public data: Array<int> = Array.create<int>(10000, 0);
}

class Node {
  public next: Node | null = null;
}

class Level3 {
  public value: int = 3;
}

class Level2 {
  public level3: Level3 = new Level3();
}

class Level1 {
  public level2: Level2 = new Level2();
}

interface MyInterface {
  id: int;
  name: string;
}

class ImplClass implements MyInterface {
  public id: int = 1;
  public name: string = "test";
}

class Config {
  public host: string = "localhost";
  public port: int = 8080;
}

class Cache {
  public data: string = "cached data";
  public timestamp: number = 1000;
}

class State {
  public count: int = 0;
  public isActive: boolean = true;
}

interface LoadWithParams {
  load: (a: number) => Object;
}

export default function AtomicReferenceLoadTest(): void {
  describe("AtomicReferenceLoadTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicReferenceLoadTest0100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_PARAM_TEST_0100
     * @tc.desc   Verify AtomicReference.load() with no parameters returns current value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(result).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceLoadTest0200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_PARAM_TEST_0200
     * @tc.desc   Verify AtomicReference.load() with extra parameters throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceLoadTest0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let errorThrown = false;
      try {
        let obj: Object = atomicRef;
        let loadFunc = obj as LoadWithParams;
        loadFunc.load(1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest0300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_0300
     * @tc.desc   Verify AtomicReference.load() returns initial value after construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let result = atomicRef.load();
      expect(result).assertEqual("initial");
    })

    /**
     * @tc.name   atomicReferenceLoadTest0400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_0400
     * @tc.desc   Verify AtomicReference.load() returns string type value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("hello world");
      let result = atomicRef.load();
      expect(typeof result).assertEqual("string");
      expect(result).assertEqual("hello world");
    })

    /**
     * @tc.name   atomicReferenceLoadTest0500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_0500
     * @tc.desc   Verify AtomicReference.load() returns object type value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      let result = atomicRef.load();
      expect(result.value).assertEqual(1);
    })

    /**
     * @tc.name   atomicReferenceLoadTest0600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_0600
     * @tc.desc   Verify AtomicReference.load() returns custom class instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj = new MyClass();
      let atomicRef = new AtomicReference<MyClass>(obj);
      let result = atomicRef.load();
      expect(result.name).assertEqual("test");
      expect(result.age).assertEqual(25);
    })

    /**
     * @tc.name   atomicReferenceLoadTest0700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_0700
     * @tc.desc   Verify AtomicReference.load() returns null value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>(null);
      let result = atomicRef.load();
      expect(result).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceLoadTest0800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_0800
     * @tc.desc   Verify AtomicReference.load() returns array object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<Array<int>>([1, 2, 3]);
      let result = atomicRef.load();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    })

    /**
     * @tc.name   atomicReferenceLoadTest0900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_0900
     * @tc.desc   Verify AtomicReference.load() returns function object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let func = (): void => {};
      let atomicRef = new AtomicReference<() => void>(func);
      let result = atomicRef.load();
      expect(typeof result).assertEqual("function");
      result();
    })

    /**
     * @tc.name   atomicReferenceLoadTest1000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1000
     * @tc.desc   Verify AtomicReference.load() returns same reference on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      let result1 = atomicRef.load();
      let result2 = atomicRef.load();
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.name   atomicReferenceLoadTest1100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1100
     * @tc.desc   Verify AtomicReference.load() returns modified value after object change
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      obj.value = 2;
      let result = atomicRef.load();
      expect(result.value).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceLoadTest1200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1200
     * @tc.desc   Verify AtomicReference.load() return value type check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(typeof result).assertEqual("string");
    })

    /**
     * @tc.name   atomicReferenceLoadTest1300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1300
     * @tc.desc   Verify AtomicReference.load() return value instanceof check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new MyClass();
      let atomicRef = new AtomicReference<MyClass>(obj);
      let result = atomicRef.load();
      expect(result instanceof MyClass).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest1400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1400
     * @tc.desc   Verify AtomicReference.load() returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("");
      let result = atomicRef.load();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    })

    /**
     * @tc.name   atomicReferenceLoadTest1500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1500
     * @tc.desc   Verify AtomicReference.load() returns long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let longStr = "a".repeat(10000);
      let atomicRef = new AtomicReference<string>(longStr);
      let result = atomicRef.load();
      expect(result.length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceLoadTest1600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1600
     * @tc.desc   Verify AtomicReference.load() returns large object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let obj = new LargeClass();
      for (let i = 0; i < 10000; i++) {
        obj.data[i] = i;
      }
      let atomicRef = new AtomicReference<LargeClass>(obj);
      let result = atomicRef.load();
      expect(result.data.length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceLoadTest1700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_RETURN_TEST_1700
     * @tc.desc   Verify AtomicReference.load() returns deeply nested object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let obj = new Level1();
      let atomicRef = new AtomicReference<Level1>(obj);
      let result = atomicRef.load();
      expect(result.level2.level3.value).assertEqual(3);
    })

    /**
     * @tc.name   atomicReferenceLoadTest1800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_ATOMIC_TEST_1800
     * @tc.desc   Verify AtomicReference.load() atomic read operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(typeof result).assertEqual("string");
    })

    /**
     * @tc.name   atomicReferenceLoadTest1900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_ATOMIC_TEST_1900
     * @tc.desc   Verify AtomicReference.load() concurrent read returns consistent value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("shared");
      let results1: string[] = [];
      let results2: string[] = [];
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicRef.load());
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicRef.load());
        }
      };
      await Promise.all([task1(), task2()]);
      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual("shared");
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual("shared");
      }
    })

    /**
     * @tc.name   atomicReferenceLoadTest2000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_ATOMIC_TEST_2000
     * @tc.desc   Verify AtomicReference.load() read operation is not interrupted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      let result = atomicRef.load();
      expect(result.value).assertEqual(1);
    })

    /**
     * @tc.name   atomicReferenceLoadTest2100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_GENERIC_TEST_2100
     * @tc.desc   Verify AtomicReference.load() with string generic type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("hello");
      let result = atomicRef.load();
      expect(typeof result).assertEqual("string");
    })

    /**
     * @tc.name   atomicReferenceLoadTest2200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_GENERIC_TEST_2200
     * @tc.desc   Verify AtomicReference.load() with custom class generic type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<MyClass>(new MyClass());
      let result = atomicRef.load();
      expect(result.name).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceLoadTest2300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_GENERIC_TEST_2300
     * @tc.desc   Verify AtomicReference.load() with union type generic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | number>("test");
      let result = atomicRef.load();
      expect(typeof result === "string" || typeof result === "number").assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest2400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_GENERIC_TEST_2400
     * @tc.desc   Verify AtomicReference.load() with union type generic including null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>("test");
      let result = atomicRef.load();
      expect(result).assertEqual("test");
      atomicRef.store(null);
      let result2 = atomicRef.load();
      expect(result2).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceLoadTest2500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_GENERIC_TEST_2500
     * @tc.desc   Verify AtomicReference.load() with interface type generic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<MyInterface>(new ImplClass());
      let result = atomicRef.load();
      expect(result.id).assertEqual(1);
    })

    /**
     * @tc.name   atomicReferenceLoadTest2600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_SPECIAL_TEST_2600
     * @tc.desc   Verify AtomicReference.load() returns new value after store
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      let result = atomicRef.load();
      expect(result).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceLoadTest2700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_SPECIAL_TEST_2700
     * @tc.desc   Verify AtomicReference.load() returns new value after exchange
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.exchange("new");
      let result = atomicRef.load();
      expect(result).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceLoadTest2800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_SPECIAL_TEST_2800
     * @tc.desc   Verify AtomicReference.load() returns new value after successful compareAndSwap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.compareAndSwap("old", "new");
      let result = atomicRef.load();
      expect(result).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceLoadTest2900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_SPECIAL_TEST_2900
     * @tc.desc   Verify AtomicReference.load() returns original value after failed compareAndSwap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("original");
      atomicRef.compareAndSwap("wrong", "new");
      let result = atomicRef.load();
      expect(result).assertEqual("original");
    })

    /**
     * @tc.name   atomicReferenceLoadTest3000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_SPECIAL_TEST_3000
     * @tc.desc   Verify AtomicReference.load() returns same value on multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result1 = atomicRef.load();
      let result2 = atomicRef.load();
      let result3 = atomicRef.load();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    })

    /**
     * @tc.name   atomicReferenceLoadTest3100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_SPECIAL_TEST_3100
     * @tc.desc   Verify AtomicReference.load() with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let node1 = new Node();
      let node2 = new Node();
      node1.next = node2;
      node2.next = node1;
      let atomicRef = new AtomicReference<Node>(node1);
      let result = atomicRef.load();
      expect(result.next).assertEqual(node2);
    })

    /**
     * @tc.name   atomicReferenceLoadTest3200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_EDGE_TEST_3200
     * @tc.desc   Verify AtomicReference.load() with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(Number.MIN_VALUE);
      let result = atomicRef.load();
      expect(result).assertEqual(Number.MIN_VALUE);
    })

    /**
     * @tc.name   atomicReferenceLoadTest3300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_EDGE_TEST_3300
     * @tc.desc   Verify AtomicReference.load() with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(Number.MAX_VALUE);
      let result = atomicRef.load();
      expect(result).assertEqual(Number.MAX_VALUE);
    })

    /**
     * @tc.name   atomicReferenceLoadTest3400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_EDGE_TEST_3400
     * @tc.desc   Verify AtomicReference.load() with NaN value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(NaN);
      let result = atomicRef.load();
      expect(isNaN(result)).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest3500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_EDGE_TEST_3500
     * @tc.desc   Verify AtomicReference.load() with Number.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(Number.POSITIVE_INFINITY);
      let result = atomicRef.load();
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   atomicReferenceLoadTest3600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_EDGE_TEST_3600
     * @tc.desc   Verify AtomicReference.load() with Number.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(Number.NEGATIVE_INFINITY);
      let result = atomicRef.load();
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   atomicReferenceLoadTest3700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_EDGE_TEST_3700
     * @tc.desc   Verify AtomicReference.load() with Unicode string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("你好世界🌍");
      let result = atomicRef.load();
      expect(result).assertEqual("你好世界🌍");
    })

    /**
     * @tc.name   atomicReferenceLoadTest3800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_EDGE_TEST_3800
     * @tc.desc   Verify AtomicReference.load() with special character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("test\n\t\r\\\"");
      let result = atomicRef.load();
      expect(result).assertEqual("test\n\t\r\\\"");
    })

    /**
     * @tc.name   atomicReferenceLoadTest3900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_ERROR_TEST_3900
     * @tc.desc   Verify AtomicReference.load() returns correct value after construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(result).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceLoadTest4000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_ERROR_TEST_4000
     * @tc.desc   Verify AtomicReference.load() return value type is correct
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest4000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(typeof result).assertEqual("string");
    })

    /**
     * @tc.name   atomicReferenceLoadTest4100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_ERROR_TEST_4100
     * @tc.desc   Verify AtomicReference.load() does not throw exception under normal conditions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest4100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      try {
        let atomicRef = new AtomicReference<string>("test");
        let result = atomicRef.load();
        expect(result).assertEqual("test");
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   atomicReferenceLoadTest4200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_PERFORMANCE_TEST_4200
     * @tc.desc   Verify AtomicReference.load() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let start = Date.now();
      let result = atomicRef.load();
      let end = Date.now();
      expect(result).assertEqual("test");
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest4300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_PERFORMANCE_TEST_4300
     * @tc.desc   Verify AtomicReference.load() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceLoadTest4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicRef.load();
      }
      let end = Date.now();
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest4400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_PERFORMANCE_TEST_4400
     * @tc.desc   Verify AtomicReference.load() large object performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceLoadTest4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let obj = new LargeClass();
      for (let i = 0; i < 10000; i++) {
        obj.data[i] = i;
      }
      let atomicRef = new AtomicReference<LargeClass>(obj);
      let start = Date.now();
      let result = atomicRef.load();
      let end = Date.now();
      expect(result.data.length).assertEqual(10000);
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest4500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_CONCURRENT_TEST_4500
     * @tc.desc   Verify AtomicReference.load() with concurrent reads from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("shared");
      let results1: string[] = [];
      let results2: string[] = [];
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicRef.load());
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicRef.load());
        }
      };
      await Promise.all([task1(), task2()]);
      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual("shared");
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual("shared");
      }
    })

    /**
     * @tc.name   atomicReferenceLoadTest4600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_CONCURRENT_TEST_4600
     * @tc.desc   Verify AtomicReference.load() with concurrent read and write operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let readResults: string[] = [];
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicRef.load());
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicRef.store(`value${i}`);
        }
      };
      await Promise.all([task1(), task2()]);
      expect(readResults.length).assertEqual(100);
    })

    /**
     * @tc.name   atomicReferenceLoadTest4700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_CONCURRENT_TEST_4700
     * @tc.desc   Verify AtomicReference.load() high concurrency read performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceLoadTest4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let start = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicRef.load();
      }
      let end = Date.now();
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceLoadTest4800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_COMPAT_TEST_4800
     * @tc.desc   Verify AtomicReference.load() compatibility with different ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceLoadTest4800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(result).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceLoadTest4900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_COMPAT_TEST_4900
     * @tc.desc   Verify AtomicReference.load() compatibility with different device platforms
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceLoadTest4900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(result).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceLoadTest5000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_COMPAT_TEST_5000
     * @tc.desc   Verify AtomicReference.load() compatibility with different operating systems
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceLoadTest5000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result = atomicRef.load();
      expect(result).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceLoadTest5100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_VERIFY_TEST_5100
     * @tc.desc   Verify AtomicReference.load() does not modify the original value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceLoadTest5100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let result1 = atomicRef.load();
      let result2 = atomicRef.load();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceLoadTest5200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_VERIFY_TEST_5200
     * @tc.desc   Verify AtomicReference.load() returns consistent value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest5200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("constant");
      let results: Array<string> = [];
      for (let i = 0; i < 100; i++) {
        results.push(atomicRef.load());
      }
      for (let i = 0; i < 100; i++) {
        expect(results[i]).assertEqual("constant");
      }
    })

    /**
     * @tc.name   atomicReferenceLoadTest5300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_VERIFY_TEST_5300
     * @tc.desc   Verify AtomicReference.load() reference immutability for object type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceLoadTest5300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      let result = atomicRef.load();
      expect(result).assertEqual(obj);
      result.value = 2;
      expect(atomicRef.load().value).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceLoadTest5400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_USAGE_TEST_5400
     * @tc.desc   Verify AtomicReference.load() for configuration object reading
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest5400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config = new Config();
      let atomicRef = new AtomicReference<Config>(config);
      let loadedConfig = atomicRef.load();
      expect(loadedConfig.host).assertEqual("localhost");
      expect(loadedConfig.port).assertEqual(8080);
    })

    /**
     * @tc.name   atomicReferenceLoadTest5500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_USAGE_TEST_5500
     * @tc.desc   Verify AtomicReference.load() for cache object reading
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest5500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let cache = new Cache();
      let atomicRef = new AtomicReference<Cache>(cache);
      let loadedCache = atomicRef.load();
      expect(loadedCache.data).assertEqual("cached data");
    })

    /**
     * @tc.name   atomicReferenceLoadTest5600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_LOAD_USAGE_TEST_5600
     * @tc.desc   Verify AtomicReference.load() for state object reading
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceLoadTest5600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let state = new State();
      let atomicRef = new AtomicReference<State>(state);
      let loadedState = atomicRef.load();
      expect(loadedState.count).assertEqual(0);
      expect(loadedState.isActive).assertTrue();
    })
  })
}
