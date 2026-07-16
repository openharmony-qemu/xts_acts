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
}

class InnerClass {
  public value: int = 10;
}

class OuterClass {
  public inner: InnerClass = new InnerClass();
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

class ImplClass1 implements MyInterface {
  public id: int = 1;
  public name: string = "test1";
}

class ImplClass2 implements MyInterface {
  public id: int = 2;
  public name: string = "test2";
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
  public status: string = "idle";
  public progress: int = 0;
}

class DataArray {
  public items: Array<string> = ["a", "b", "c"];
}

class DataSimple {
  public value: string = "initial";
}

interface StoreNoParam {
  store: () => void;
}

interface StoreWithNumberParam {
  store: (a: number) => void;
}

interface StoreWithObjectParam {
  store: (a: Object) => void;
}

export default function AtomicReferenceStoreTest(): void {
  describe("AtomicReferenceStoreTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicReferenceStoreTest0100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0100
     * @tc.desc   Verify AtomicReference.store() with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest0200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0200
     * @tc.desc   Verify AtomicReference.store() throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let errorThrown = false;
      try {
        let obj: Object = atomicRef;
        let storeFunc = obj as StoreNoParam;
        storeFunc.store();
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest0300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0300
     * @tc.desc   Verify AtomicReference.store() with string type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest0400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0400
     * @tc.desc   Verify AtomicReference.store() with object type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<Container>(new Container());
      let newObj = new Container();
      newObj.value = 2;
      atomicRef.store(newObj);
      expect(atomicRef.load().value).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceStoreTest0500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0500
     * @tc.desc   Verify AtomicReference.store() with custom class instance parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<MyClass>(new MyClass());
      let newObj = new MyClass();
      newObj.name = "updated";
      atomicRef.store(newObj);
      expect(atomicRef.load().name).assertEqual("updated");
    })

    /**
     * @tc.name   atomicReferenceStoreTest0600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0600
     * @tc.desc   Verify AtomicReference.store() with null value when generic includes null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>("test");
      atomicRef.store(null);
      expect(atomicRef.load()).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceStoreTest0700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0700
     * @tc.desc   Verify AtomicReference.store() with undefined value throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      try {
        let atomicRef = new AtomicReference<string>("test");
        atomicRef.store(undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   atomicReferenceStoreTest0800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0800
     * @tc.desc   Verify AtomicReference.store() with number type parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(100);
      atomicRef.store(200);
      expect(atomicRef.load()).assertEqual(200);
    })

    /**
     * @tc.name   atomicReferenceStoreTest0900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_0900
     * @tc.desc   Verify AtomicReference.store() with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      atomicRef.store("");
      expect(atomicRef.load()).assertEqual("");
    })

    /**
     * @tc.name   atomicReferenceStoreTest1000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_1000
     * @tc.desc   Verify AtomicReference.store() with long string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let longStr = "a".repeat(10000);
      let atomicRef = new AtomicReference<string>("test");
      atomicRef.store(longStr);
      expect(atomicRef.load().length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceStoreTest1100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_1100
     * @tc.desc   Verify AtomicReference.store() with array object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<Array<int>>([1, 2, 3]);
      atomicRef.store([4, 5, 6]);
      let result = atomicRef.load();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
    })

    /**
     * @tc.name   atomicReferenceStoreTest1200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_1200
     * @tc.desc   Verify AtomicReference.store() with function object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let func1 = (): void => {};
      let func2 = (): void => {};
      let atomicRef = new AtomicReference<() => void>(func1);
      atomicRef.store(func2);
      let result = atomicRef.load();
      expect(result).assertEqual(func2);
    })

    /**
     * @tc.name   atomicReferenceStoreTest1300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PARAM_TEST_1300
     * @tc.desc   Verify AtomicReference.store() with nested object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<OuterClass>(new OuterClass());
      let newObj = new OuterClass();
      newObj.inner.value = 20;
      atomicRef.store(newObj);
      expect(atomicRef.load().inner.value).assertEqual(20);
    })

    /**
     * @tc.name   atomicReferenceStoreTest1400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_RETURN_TEST_1400
     * @tc.desc   Verify AtomicReference.store() returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let result = atomicRef.store("new");
      expect(result).assertEqual(undefined);
    })

    /**
     * @tc.name   atomicReferenceStoreTest1500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_RETURN_TEST_1500
     * @tc.desc   Verify AtomicReference.store() return type is undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let result = atomicRef.store("new");
      expect(typeof result).assertEqual("undefined");
    })

    /**
     * @tc.name   atomicReferenceStoreTest1600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_RETURN_TEST_1600
     * @tc.desc   Verify AtomicReference.store() correctly updates the value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest1700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_RETURN_TEST_1700
     * @tc.desc   Verify AtomicReference.store() correctly replaces object reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let newObj = new Container();
      newObj.value = 2;
      atomicRef.store(newObj);
      expect(atomicRef.load()).assertEqual(newObj);
      expect(atomicRef.load() !== oldObj).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest1800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_ATOMIC_TEST_1800
     * @tc.desc   Verify AtomicReference.store() atomic write operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest1900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_ATOMIC_TEST_1900
     * @tc.desc   Verify AtomicReference.store() with concurrent writes from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicRef.store("value1");
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicRef.store("value2");
        }
      };
      await Promise.all([task1(), task2()]);
      let finalValue = atomicRef.load();
      expect(finalValue === "value1" || finalValue === "value2").assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest2000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_ATOMIC_TEST_2000
     * @tc.desc   Verify AtomicReference.store() write operation is not interrupted
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let oldObj = new Container();
      let newObj = new Container();
      newObj.value = 2;
      let atomicRef = new AtomicReference<Container>(oldObj);
      atomicRef.store(newObj);
      expect(atomicRef.load().value).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceStoreTest2100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_GENERIC_TEST_2100
     * @tc.desc   Verify AtomicReference.store() with string generic type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest2200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_GENERIC_TEST_2200
     * @tc.desc   Verify AtomicReference.store() with custom class generic type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<MyClass>(new MyClass());
      let newObj = new MyClass();
      newObj.name = "updated";
      atomicRef.store(newObj);
      expect(atomicRef.load().name).assertEqual("updated");
    })

    /**
     * @tc.name   atomicReferenceStoreTest2300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_GENERIC_TEST_2300
     * @tc.desc   Verify AtomicReference.store() with union type generic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | number>("test");
      atomicRef.store(123);
      expect(atomicRef.load()).assertEqual(123);
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest2400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_GENERIC_TEST_2400
     * @tc.desc   Verify AtomicReference.store() with null type generic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>("test");
      atomicRef.store(null);
      expect(atomicRef.load()).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceStoreTest2500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_GENERIC_TEST_2500
     * @tc.desc   Verify AtomicReference.store() with interface type generic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<MyInterface>(new ImplClass1());
      atomicRef.store(new ImplClass2());
      expect(atomicRef.load().id).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceStoreTest2600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_SPECIAL_TEST_2600
     * @tc.desc   Verify AtomicReference.store() overwrites with same value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      atomicRef.store("test");
      expect(atomicRef.load()).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceStoreTest2700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_SPECIAL_TEST_2700
     * @tc.desc   Verify AtomicReference.store() overwrites value to null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>("test");
      atomicRef.store(null);
      expect(atomicRef.load()).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceStoreTest2800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_SPECIAL_TEST_2800
     * @tc.desc   Verify AtomicReference.store() overwrites from null to new value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>(null);
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest2900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_SPECIAL_TEST_2900
     * @tc.desc   Verify AtomicReference.store() multiple consecutive stores keep the last value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      atomicRef.store("first");
      atomicRef.store("second");
      atomicRef.store("third");
      expect(atomicRef.load()).assertEqual("third");
    })

    /**
     * @tc.name   atomicReferenceStoreTest3000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_SPECIAL_TEST_3000
     * @tc.desc   Verify AtomicReference.store() followed by immediate load
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      let result = atomicRef.load();
      expect(result).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest3100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_SPECIAL_TEST_3100
     * @tc.desc   Verify AtomicReference.store() mixed with load, exchange, compareAndSwap
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      atomicRef.store("first");
      let loaded = atomicRef.load();
      expect(loaded).assertEqual("first");
      atomicRef.exchange("second");
      expect(atomicRef.load()).assertEqual("second");
      atomicRef.store("third");
      expect(atomicRef.load()).assertEqual("third");
    })

    /**
     * @tc.name   atomicReferenceStoreTest3200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_SPECIAL_TEST_3200
     * @tc.desc   Verify AtomicReference.store() with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let node1 = new Node();
      let node2 = new Node();
      node1.next = node2;
      node2.next = node1;
      let atomicRef = new AtomicReference<Node>(new Node());
      atomicRef.store(node1);
      let result = atomicRef.load();
      expect(result.next).assertEqual(node2);
    })

    /**
     * @tc.name   atomicReferenceStoreTest3300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_3300
     * @tc.desc   Verify AtomicReference.store() with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(0);
      atomicRef.store(Number.MIN_VALUE);
      expect(atomicRef.load()).assertEqual(Number.MIN_VALUE);
    })

    /**
     * @tc.name   atomicReferenceStoreTest3400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_3400
     * @tc.desc   Verify AtomicReference.store() with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(0);
      atomicRef.store(Number.MAX_VALUE);
      expect(atomicRef.load()).assertEqual(Number.MAX_VALUE);
    })

    /**
     * @tc.name   atomicReferenceStoreTest3500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_3500
     * @tc.desc   Verify AtomicReference.store() with NaN value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(0);
      atomicRef.store(NaN);
      expect(isNaN(atomicRef.load())).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest3600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_3600
     * @tc.desc   Verify AtomicReference.store() with Number.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(0);
      atomicRef.store(Number.POSITIVE_INFINITY);
      expect(atomicRef.load()).assertEqual(Number.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   atomicReferenceStoreTest3700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_3700
     * @tc.desc   Verify AtomicReference.store() with Number.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<number>(0);
      atomicRef.store(Number.NEGATIVE_INFINITY);
      expect(atomicRef.load()).assertEqual(Number.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   atomicReferenceStoreTest3800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_3800
     * @tc.desc   Verify AtomicReference.store() with Unicode string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("test");
      atomicRef.store("你好世界🌍");
      expect(atomicRef.load()).assertEqual("你好世界🌍");
    })

    /**
     * @tc.name   atomicReferenceStoreTest3900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_3900
     * @tc.desc   Verify AtomicReference.store() with special character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("test");
      atomicRef.store("test\n\t\r\\\"");
      expect(atomicRef.load()).assertEqual("test\n\t\r\\\"");
    })

    /**
     * @tc.name   atomicReferenceStoreTest4000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_4000
     * @tc.desc   Verify AtomicReference.store() with large object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest4000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let obj = new LargeClass();
      for (let i = 0; i < 10000; i++) {
        obj.data[i] = i;
      }
      let atomicRef = new AtomicReference<LargeClass>(new LargeClass());
      atomicRef.store(obj);
      expect(atomicRef.load().data.length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceStoreTest4100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_EDGE_TEST_4100
     * @tc.desc   Verify AtomicReference.store() with deeply nested object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest4100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<Level1>(new Level1());
      let newObj = new Level1();
      newObj.level2.level3.value = 33;
      atomicRef.store(newObj);
      expect(atomicRef.load().level2.level3.value).assertEqual(33);
    })

    /**
     * @tc.name   atomicReferenceStoreTest4200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_ERROR_TEST_4200
     * @tc.desc   Verify AtomicReference.store() with mismatched type parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest4200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let errorThrown = false;
      try {
        let obj: Object = atomicRef;
        let storeFunc = obj as StoreWithNumberParam;
        storeFunc.store(123);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest4300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_ERROR_TEST_4300
     * @tc.desc   Verify AtomicReference.store() with undefined for non-null generic throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest4300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      try {
        let atomicRef = new AtomicReference<string>("test");
        atomicRef.store(undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   atomicReferenceStoreTest4400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_ERROR_TEST_4400
     * @tc.desc   Verify AtomicReference.store() does not throw exception under normal conditions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest4400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      try {
        let atomicRef = new AtomicReference<string>("test");
        atomicRef.store("new");
        expect(atomicRef.load()).assertEqual("new");
      } catch (error) {
        expect().assertFail();
      }
    })

    /**
     * @tc.name   atomicReferenceStoreTest4500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PERFORMANCE_TEST_4500
     * @tc.desc   Verify AtomicReference.store() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let start = Date.now();
      atomicRef.store("new");
      let end = Date.now();
      expect(atomicRef.load()).assertEqual("new");
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest4600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PERFORMANCE_TEST_4600
     * @tc.desc   Verify AtomicReference.store() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicRef.store(`test${i}`);
      }
      let end = Date.now();
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest4700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_PERFORMANCE_TEST_4700
     * @tc.desc   Verify AtomicReference.store() large object performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let obj = new LargeClass();
      for (let i = 0; i < 10000; i++) {
        obj.data[i] = i;
      }
      let atomicRef = new AtomicReference<LargeClass>(new LargeClass());
      let start = Date.now();
      atomicRef.store(obj);
      let end = Date.now();
      expect(atomicRef.load().data.length).assertEqual(10000);
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest4800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_CONCURRENT_TEST_4800
     * @tc.desc   Verify AtomicReference.store() with concurrent writes from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicRef.store("value1");
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicRef.store("value2");
        }
      };
      await Promise.all([task1(), task2()]);
      let result = atomicRef.load();
      expect(result === "value1" || result === "value2").assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest4900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_CONCURRENT_TEST_4900
     * @tc.desc   Verify AtomicReference.store() with concurrent read and write operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   atomicReferenceStoreTest5000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_CONCURRENT_TEST_5000
     * @tc.desc   Verify AtomicReference.store() high concurrency write performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let start = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicRef.store(`test${i}`);
      }
      let end = Date.now();
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest5100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_COMPAT_TEST_5100
     * @tc.desc   Verify AtomicReference.store() compatibility with different ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest5100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest5200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_COMPAT_TEST_5200
     * @tc.desc   Verify AtomicReference.store() compatibility with different device platforms
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest5200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest5300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_COMPAT_TEST_5300
     * @tc.desc   Verify AtomicReference.store() compatibility with different operating systems
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceStoreTest5300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.store("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceStoreTest5400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_VERIFY_TEST_5400
     * @tc.desc   Verify AtomicReference.store() value change before and after store
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest5400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let oldValue = atomicRef.load();
      atomicRef.store("new");
      let newValue = atomicRef.load();
      expect(oldValue).assertEqual("old");
      expect(newValue).assertEqual("new");
      expect(oldValue !== newValue).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest5500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_VERIFY_TEST_5500
     * @tc.desc   Verify AtomicReference.store() correctly replaces object reference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceStoreTest5500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let loadedBefore = atomicRef.load();
      let newObj = new Container();
      newObj.value = 2;
      atomicRef.store(newObj);
      let loadedAfter = atomicRef.load();
      expect(loadedBefore).assertEqual(oldObj);
      expect(loadedAfter).assertEqual(newObj);
      expect(loadedBefore !== loadedAfter).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceStoreTest5600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_VERIFY_TEST_5600
     * @tc.desc   Verify AtomicReference.store() old object is not affected after store
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceStoreTest5600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let newObj = new Container();
      newObj.value = 2;
      atomicRef.store(newObj);
      expect(oldObj.value).assertEqual(1);
    })

    /**
     * @tc.name   atomicReferenceStoreTest5700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_USAGE_TEST_5700
     * @tc.desc   Verify AtomicReference.store() for configuration update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest5700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<Config>(new Config());
      let newConfig = new Config();
      newConfig.host = "remote";
      newConfig.port = 9090;
      atomicRef.store(newConfig);
      let loadedConfig = atomicRef.load();
      expect(loadedConfig.host).assertEqual("remote");
      expect(loadedConfig.port).assertEqual(9090);
    })

    /**
     * @tc.name   atomicReferenceStoreTest5800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_USAGE_TEST_5800
     * @tc.desc   Verify AtomicReference.store() for cache update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest5800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<Cache>(new Cache());
      let newCache = new Cache();
      newCache.data = "new cached data";
      newCache.timestamp = Date.now();
      atomicRef.store(newCache);
      let loadedCache = atomicRef.load();
      expect(loadedCache.data).assertEqual("new cached data");
    })

    /**
     * @tc.name   atomicReferenceStoreTest5900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_USAGE_TEST_5900
     * @tc.desc   Verify AtomicReference.store() for state switching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest5900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<State>(new State());
      let newState = new State();
      newState.status = "running";
      newState.progress = 50;
      atomicRef.store(newState);
      let loadedState = atomicRef.load();
      expect(loadedState.status).assertEqual("running");
      expect(loadedState.progress).assertEqual(50);
    })

    /**
     * @tc.name   atomicReferenceStoreTest6000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_USAGE_TEST_6000
     * @tc.desc   Verify AtomicReference.store() for data replacement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest6000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<DataArray>(new DataArray());
      let newData = new DataArray();
      let newItems: Array<string> = ["x", "y", "z"];
      newData.items = newItems;
      atomicRef.store(newData);
      let loadedData = atomicRef.load();
      expect(loadedData.items[0]).assertEqual("x");
    })

    /**
     * @tc.name   atomicReferenceStoreTest6100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_STORE_USAGE_TEST_6100
     * @tc.desc   Verify AtomicReference.store() for reference reset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceStoreTest6100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<DataSimple>(new DataSimple());
      let modifiedData = atomicRef.load();
      modifiedData.value = "modified";
      atomicRef.store(modifiedData);
      let initialData = new DataSimple();
      atomicRef.store(initialData);
      expect(atomicRef.load().value).assertEqual("initial");
    })
  })
}
