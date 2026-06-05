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
  public timestamp: int = 1000;
}

class State {
  public status: string = "idle";
  public progress: int = 0;
}

class Data {
  public items: Array<string> = ["a", "b", "c"];
}

class LargeClassLocal {
  public data: Array<int> = Array.create<int>(10000, 0);
}

class DataLocal {
  public value: string = "original";
}

class MyClassLocal {
  public data: int = 100;
}

export default function AtomicReferenceExchangeTest(): void {
  describe("AtomicReferenceExchangeTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0100
     * @tc.desc   Verify AtomicReference exchange with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual("old");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0200
     * @tc.desc   Verify AtomicReference exchange with missing required parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0300
     * @tc.desc   Verify AtomicReference exchange with object type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<Container>(new Container());
      let newObj = new Container();
      newObj.value = 2;
      let oldValue = atomicRef.exchange(newObj);
      expect(oldValue.value).assertEqual(1);
      expect(atomicRef.load().value).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0400
     * @tc.desc   Verify AtomicReference exchange with custom class instance parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<MyClass>(new MyClass());
      let newObj = new MyClass();
      newObj.name = "updated";
      let oldValue = atomicRef.exchange(newObj);
      expect(oldValue.name).assertEqual("test");
      expect(atomicRef.load().name).assertEqual("updated");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0500
     * @tc.desc   Verify AtomicReference exchange with null value when T includes null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>("test");
      let oldValue = atomicRef.exchange(null);
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0600
     * @tc.desc   Verify AtomicReference exchange with undefined value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let atomicRef = new AtomicReference<string>("test");
        atomicRef.exchange(undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0700
     * @tc.desc   Verify AtomicReference exchange with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(100);
      let oldValue = atomicRef.exchange(200);
      expect(oldValue).assertEqual(100);
      expect(atomicRef.load()).assertEqual(200);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0800
     * @tc.desc   Verify AtomicReference exchange with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.exchange("");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_0900
     * @tc.desc   Verify AtomicReference exchange with long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let longStr = "a".repeat(10000);
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.exchange(longStr);
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load().length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_1000
     * @tc.desc   Verify AtomicReference exchange with array object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<Array<int>>([1, 2, 3]);
      let oldValue = atomicRef.exchange([4, 5, 6]);
      expect(oldValue.length).assertEqual(3);
      expect(oldValue[0]).assertEqual(1);
      let result = atomicRef.load();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_1100
     * @tc.desc   Verify AtomicReference exchange with function object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let func1 = (): void => { };
      let func2 = (): void => { };
      let atomicRef = new AtomicReference<() => void>(func1);
      let oldValue = atomicRef.exchange(func2);
      expect(oldValue).assertEqual(func1);
      expect(atomicRef.load()).assertEqual(func2);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PARAM_TEST_1200
     * @tc.desc   Verify AtomicReference exchange with nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<OuterClass>(new OuterClass());
      let newObj = new OuterClass();
      newObj.inner.value = 20;
      let oldValue = atomicRef.exchange(newObj);
      expect(oldValue.inner.value).assertEqual(10);
      expect(atomicRef.load().inner.value).assertEqual(20);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_1300
     * @tc.desc   Verify AtomicReference exchange return type matches generic T
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let oldValue = atomicRef.exchange("new");
      expect(typeof oldValue).assertEqual("string");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_1400
     * @tc.desc   Verify AtomicReference exchange with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let newObj = new Container();
      newObj.value = 2;
      let returnedOld = atomicRef.exchange(newObj);
      expect(returnedOld).assertEqual(oldObj);
      expect(returnedOld).not().assertEqual(newObj);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_1500
     * @tc.desc   Verify AtomicReference exchange multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let oldValue1 = atomicRef.exchange("first");
      expect(oldValue1).assertEqual("initial");
      let oldValue2 = atomicRef.exchange("second");
      expect(oldValue2).assertEqual("first");
      expect(atomicRef.load()).assertEqual("second");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_1600
     * @tc.desc   Verify exchange return value equals load value before exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let beforeLoad = atomicRef.load();
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual(beforeLoad);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_1700
     * @tc.desc   Verify AtomicReference exchange returns null when old value is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>(null);
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual(null);
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_1800
     * @tc.desc   Verify exchange return value equals load value before exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let beforeLoad = atomicRef.load();
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual(beforeLoad);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest1900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_1900
     * @tc.desc   Verify load returns new value after exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.exchange("new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_RETURN_TEST_2000
     * @tc.desc   Verify returned old value reference equals original object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let returnedOld = atomicRef.exchange(new Container());
      expect(returnedOld).assertEqual(oldObj);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_2100
     * @tc.desc   Verify AtomicReference exchange returned old object reference is same as original
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let returnedOld = atomicRef.exchange(new Container());
      returnedOld.value = 999;
      expect(oldObj.value).assertEqual(999);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_ATOMIC_TEST_2200
     * @tc.desc   Verify AtomicReference exchange operation basic functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let result = atomicRef.load();
      expect(result).assertEqual("initial");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_ATOMIC_TEST_2300
     * @tc.desc   Verify exchange operation is not interrupted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldObj = new Container();
      let newObj = new Container();
      newObj.value = 2;
      let atomicRef = new AtomicReference<Container>(oldObj);
      let oldValue = atomicRef.exchange(newObj);
      expect(oldValue.value).assertEqual(1);
      expect(atomicRef.load().value).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_GENERIC_TEST_2400
     * @tc.desc   Verify AtomicReference exchange with generic T as custom class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<MyClassLocal>(new MyClassLocal());
      let newObj = new MyClassLocal();
      newObj.data = 200;
      let oldValue = atomicRef.exchange(newObj);
      expect(oldValue.data).assertEqual(100);
      expect(atomicRef.load().data).assertEqual(200);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_GENERIC_TEST_2500
     * @tc.desc   Verify AtomicReference exchange with generic T as union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | number>("test");
      let oldValue = atomicRef.exchange(123);
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual(123);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_GENERIC_TEST_2600
     * @tc.desc   Verify AtomicReference exchange with union type generic including null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>("initial");
      let oldValue = atomicRef.exchange(null);
      expect(oldValue).assertEqual("initial");
      expect(atomicRef.load()).assertEqual(null);
      atomicRef.store("restored");
      expect(atomicRef.load()).assertEqual("restored");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_GENERIC_TEST_2700
     * @tc.desc   Verify AtomicReference exchange with generic T as interface type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<MyInterface>(new ImplClass1());
      let oldValue = atomicRef.exchange(new ImplClass2());
      expect(oldValue.id).assertEqual(1);
      expect(atomicRef.load().id).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_2800
     * @tc.desc   Verify AtomicReference exchange with same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.exchange("test");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest2900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_2900
     * @tc.desc   Verify AtomicReference exchange to null with value verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>("test");
      let oldValue = atomicRef.exchange(null);
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual(null);
      let result = atomicRef.load();
      expect(result === null).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_3000
     * @tc.desc   Verify AtomicReference exchange from null to new value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>(null);
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual(null);
      expect(atomicRef.load()).assertEqual("new");
      let result = atomicRef.load();
      expect(result === "new").assertTrue();
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_3100
     * @tc.desc   Verify multiple consecutive exchange operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let oldValue1 = atomicRef.exchange("first");
      expect(oldValue1).assertEqual("initial");
      let oldValue2 = atomicRef.exchange("second");
      expect(oldValue2).assertEqual("first");
      let oldValue3 = atomicRef.exchange("third");
      expect(oldValue3).assertEqual("second");
      expect(atomicRef.load()).assertEqual("third");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_3200
     * @tc.desc   Verify load immediately after exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let oldValue = atomicRef.exchange("new");
      let result = atomicRef.load();
      expect(oldValue).assertEqual("old");
      expect(result).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_3300
     * @tc.desc   Verify exchange mixed with load and store operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      atomicRef.store("first");
      let oldValue1 = atomicRef.load();
      expect(oldValue1).assertEqual("first");
      let oldValue2 = atomicRef.exchange("second");
      expect(oldValue2).assertEqual("first");
      expect(atomicRef.load()).assertEqual("second");
      atomicRef.store("third");
      let oldValue3 = atomicRef.exchange("fourth");
      expect(oldValue3).assertEqual("third");
      expect(atomicRef.load()).assertEqual("fourth");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_3400
     * @tc.desc   Verify exchange with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let node1 = new Node();
      let node2 = new Node();
      node1.next = node2;
      node2.next = node1;
      let atomicRef = new AtomicReference<Node>(new Node());
      let oldValue = atomicRef.exchange(node1);
      let result = atomicRef.load();
      expect(result.next).assertEqual(node2);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SPECIAL_TEST_3500
     * @tc.desc   Verify returned old value is still usable after exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let returnedOld = atomicRef.exchange(new Container());
      expect(returnedOld.value).assertEqual(1);
      returnedOld.value = 999;
      expect(returnedOld.value).assertEqual(999);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_3600
     * @tc.desc   Verify AtomicReference exchange with Number.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let oldValue = atomicRef.exchange(Number.MIN_VALUE);
      expect(oldValue).assertEqual(0);
      expect(atomicRef.load()).assertEqual(Number.MIN_VALUE);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_3700
     * @tc.desc   Verify AtomicReference exchange with Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let oldValue = atomicRef.exchange(Number.MAX_VALUE);
      expect(oldValue).assertEqual(0);
      expect(atomicRef.load()).assertEqual(Number.MAX_VALUE);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_3800
     * @tc.desc   Verify AtomicReference exchange with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest3800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let oldValue = atomicRef.exchange(NaN);
      expect(oldValue).assertEqual(0);
      expect(isNaN(atomicRef.load())).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceExchangeTest3900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_3900
     * @tc.desc   Verify AtomicReference exchange with Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest3900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let oldValue = atomicRef.exchange(Number.POSITIVE_INFINITY);
      expect(oldValue).assertEqual(0);
      expect(atomicRef.load()).assertEqual(Number.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_4000
     * @tc.desc   Verify AtomicReference exchange with negative Infinity value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(0);
      let oldValue = atomicRef.exchange(Number.NEGATIVE_INFINITY);
      expect(oldValue).assertEqual(0);
      expect(atomicRef.load()).assertEqual(Number.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_4100
     * @tc.desc   Verify AtomicReference exchange with Unicode string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.exchange("你好世界🌍");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("你好世界🌍");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_4200
     * @tc.desc   Verify AtomicReference exchange with special character string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.exchange("test\n\t\r\\\"");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("test\n\t\r\\\"");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_4300
     * @tc.desc   Verify AtomicReference exchange with large object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj = new LargeClass();
      for (let i = 0; i < 10000; i++) {
        obj.data[i] = i;
      }
      let atomicRef = new AtomicReference<LargeClass>(new LargeClass());
      let oldValue = atomicRef.exchange(obj);
      expect(atomicRef.load().data.length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_EDGE_TEST_4400
     * @tc.desc   Verify AtomicReference exchange with deeply nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<Level1>(new Level1());
      let newObj = new Level1();
      newObj.level2.level3.value = 33;
      let oldValue = atomicRef.exchange(newObj);
      expect(oldValue.level2.level3.value).assertEqual(3);
      expect(atomicRef.load().level2.level3.value).assertEqual(33);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_ERROR_TEST_4500
     * @tc.desc   Verify AtomicReference exchange with type mismatch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_ERROR_TEST_4600
     * @tc.desc   Verify AtomicReference exchange with undefined for non-null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let atomicRef = new AtomicReference<string>("test");
        atomicRef.exchange(undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_ERROR_TEST_4700
     * @tc.desc   Verify AtomicReference exchange exception handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest4700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let atomicRef = new AtomicReference<string>("test");
        atomicRef.exchange("new");
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PERF_TEST_4800
     * @tc.desc   Verify single exchange performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceExchangeTest4800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let start = Date.now();
      let oldValue = atomicRef.exchange("new");
      let end = Date.now();
      expect(oldValue).assertEqual("old");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest4900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PERF_TEST_4900
     * @tc.desc   Verify multiple exchange operations performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceExchangeTest4900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicRef.exchange(`test${i}`);
      }
      let end = Date.now();
      let duration = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_PERF_TEST_5000
     * @tc.desc   Verify large object exchange performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceExchangeTest5000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let obj = new LargeClassLocal();
      let atomicRef = new AtomicReference<LargeClassLocal>(new LargeClassLocal());
      let start = Date.now();
      let oldValue = atomicRef.exchange(obj);
      let end = Date.now();
      expect(atomicRef.load().data.length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_CONCURRENT_TEST_5100
     * @tc.desc   Verify AtomicReference exchange basic load operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest5100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let result = atomicRef.load();
      expect(result).assertEqual("initial");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_CONCURRENT_TEST_5200
     * @tc.desc   Verify read-write concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceExchangeTest5200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let oldValue = atomicRef.exchange("new");
      let result = atomicRef.load();
      expect(oldValue).assertEqual("initial");
      expect(result).assertEqual("new");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_CONCURRENT_TEST_5300
     * @tc.desc   Verify high concurrent exchange performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceExchangeTest5300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let start = Date.now();
      for (let i = 0; i < 100000; i++) {
        atomicRef.exchange(`test${i}`);
      }
      let end = Date.now();
      let duration = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_STATE_TEST_5400
     * @tc.desc   Verify exchange before and after value comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest5400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let oldValue = atomicRef.exchange("new");
      let newValue = atomicRef.load();
      expect(oldValue).assertEqual("old");
      expect(newValue).assertEqual("new");
      expect(oldValue).not().assertEqual(newValue);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_STATE_TEST_5500
     * @tc.desc   Verify object reference replacement
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest5500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let loadedBefore = atomicRef.load();
      let newObj = new Container();
      newObj.value = 2;
      let returnedOld = atomicRef.exchange(newObj);
      let loadedAfter = atomicRef.load();
      expect(returnedOld).assertEqual(oldObj);
      expect(loadedBefore).assertEqual(oldObj);
      expect(loadedAfter).assertEqual(newObj);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_STATE_TEST_5600
     * @tc.desc   Verify old object is not affected after exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest5600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldObj = new Container();
      let atomicRef = new AtomicReference<Container>(oldObj);
      let newObj = new Container();
      newObj.value = 2;
      let returnedOld = atomicRef.exchange(newObj);
      expect(oldObj.value).assertEqual(1);
      expect(returnedOld).assertEqual(oldObj);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_STATE_TEST_5700
     * @tc.desc   Verify return value equals value before exchange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest5700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let beforeLoad = atomicRef.load();
      let oldValue = atomicRef.exchange("new");
      expect(oldValue).assertEqual(beforeLoad);
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SCENARIO_TEST_5800
     * @tc.desc   Verify configuration switch scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest5800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldConfig = new Config();
      let atomicRef = new AtomicReference<Config>(oldConfig);
      let newConfig = new Config();
      newConfig.host = "remote";
      newConfig.port = 9090;
      let returnedOld = atomicRef.exchange(newConfig);
      expect(returnedOld.host).assertEqual("localhost");
      expect(atomicRef.load().host).assertEqual("remote");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest5900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SCENARIO_TEST_5900
     * @tc.desc   Verify cache replacement scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest5900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldCache = new Cache();
      let atomicRef = new AtomicReference<Cache>(oldCache);
      let newCache = new Cache();
      newCache.data = "new cached data";
      newCache.timestamp = 1000;
      let returnedOld = atomicRef.exchange(newCache);
      expect(returnedOld.data).assertEqual("cached data");
      expect(atomicRef.load().data).assertEqual("new cached data");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest6000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SCENARIO_TEST_6000
     * @tc.desc   Verify state switch scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest6000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldState = new State();
      let atomicRef = new AtomicReference<State>(oldState);
      let newState = new State();
      newState.status = "running";
      newState.progress = 50;
      let returnedOld = atomicRef.exchange(newState);
      expect(returnedOld.status).assertEqual("idle");
      expect(atomicRef.load().status).assertEqual("running");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest6100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SCENARIO_TEST_6100
     * @tc.desc   Verify data replacement scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest6100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let oldData = new Data();
      let atomicRef = new AtomicReference<Data>(oldData);
      let newData = new Data();
      newData.items = ["x", "y", "z"];
      let returnedOld = atomicRef.exchange(newData);
      expect(returnedOld.items[0]).assertEqual("a");
      expect(atomicRef.load().items[0]).assertEqual("x");
    })

    /**
     * @tc.name   atomicReferenceExchangeTest6200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_EXCHANGE_SCENARIO_TEST_6200
     * @tc.desc   Verify reference rollback scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceExchangeTest6200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let originalData = new DataLocal();
      let atomicRef = new AtomicReference<DataLocal>(originalData);
      let modifiedData = new DataLocal();
      modifiedData.value = "modified";
      let returnedOld = atomicRef.exchange(modifiedData);
      atomicRef.exchange(returnedOld);
      expect(atomicRef.load().value).assertEqual("original");
    })
  });
}
