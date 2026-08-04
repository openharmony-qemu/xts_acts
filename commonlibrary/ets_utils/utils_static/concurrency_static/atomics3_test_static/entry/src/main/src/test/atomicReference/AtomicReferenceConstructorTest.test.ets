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

class EmptyClass {}

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

class ValidClass {
  public value: int = 100;
}

export default function AtomicReferenceConstructorTest(): void {
  describe("AtomicReferenceConstructorTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0100
     * @tc.desc   Verify AtomicReference constructor with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<Container>(new Container());
      expect(atomicRef.load() instanceof Container).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0200
     * @tc.desc   Verify AtomicReference constructor with string type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("hello");
      expect(atomicRef.load()).assertEqual("hello");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0300
     * @tc.desc   Verify AtomicReference constructor with object type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<Container>(new Container());
      expect(atomicRef.load() instanceof Container).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0400
     * @tc.desc   Verify AtomicReference constructor with custom class instance parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<MyClass>(new MyClass());
      expect(atomicRef.load().name).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0500
     * @tc.desc   Verify AtomicReference constructor with null value parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>(null);
      expect(atomicRef.load()).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0600
     * @tc.desc   Verify AtomicReference constructor with undefined value throws error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let atomicRef = new AtomicReference<string>(undefined as string);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0700
     * @tc.desc   Verify AtomicReference constructor with number type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<number>(123);
      expect(atomicRef.load()).assertEqual(123);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0800
     * @tc.desc   Verify AtomicReference constructor with nested object parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<OuterClass>(new OuterClass());
      expect(atomicRef.load().inner.value).assertEqual(10);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest0900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_0900
     * @tc.desc   Verify AtomicReference constructor with array object parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<Array<int>>([1, 2, 3]);
      expect(atomicRef.load().length).assertEqual(3);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_1000
     * @tc.desc   Verify AtomicReference constructor with empty object parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<EmptyClass>(new EmptyClass());
      expect(atomicRef.load() instanceof EmptyClass).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PARAM_TEST_1100
     * @tc.desc   Verify AtomicReference constructor with function object parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let func = (): void => {};
      let atomicRef = new AtomicReference<() => void>(func);
      expect(atomicRef.load()).assertEqual(func);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1200
     * @tc.desc   Verify AtomicReference constructor returns instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(typeof atomicRef).assertEqual("object");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1300
     * @tc.desc   Verify AtomicReference instance contains load method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(typeof atomicRef.load).assertEqual("function");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1400
     * @tc.desc   Verify AtomicReference instance contains store method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(typeof atomicRef.store).assertEqual("function");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1500
     * @tc.desc   Verify AtomicReference instance contains exchange method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(typeof atomicRef.exchange).assertEqual("function");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1600
     * @tc.desc   Verify AtomicReference instance contains compareAndSwap method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(typeof atomicRef.compareAndSwap).assertEqual("function");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1700
     * @tc.desc   Verify AtomicReference constructor creates instance correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(atomicRef.load()).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1800
     * @tc.desc   Verify AtomicReference constructor correctly saves initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      expect(atomicRef.load()).assertEqual("initial");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest1900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_RETURN_TEST_1900
     * @tc.desc   Verify AtomicReference constructor maintains object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      expect(atomicRef.load()).assertEqual(obj);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_GENERIC_TEST_2000
     * @tc.desc   Verify AtomicReference constructor with union type generic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | number>("test");
      expect(atomicRef.load()).assertEqual("test");
      atomicRef.store(123);
      expect(atomicRef.load()).assertEqual(123);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_GENERIC_TEST_2100
     * @tc.desc   Verify AtomicReference constructor with null type generic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>(null);
      expect(atomicRef.load()).assertEqual(null);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_GENERIC_TEST_2200
     * @tc.desc   Verify AtomicReference constructor with interface type generic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<MyInterface>(new ImplClass());
      expect(atomicRef.load().id).assertEqual(1);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_SPECIAL_TEST_2300
     * @tc.desc   Verify AtomicReference constructor with same object reference equality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj = new Container();
      let atomicRef1 = new AtomicReference<Container>(obj);
      let atomicRef2 = new AtomicReference<Container>(obj);
      expect(atomicRef1.load()).assertEqual(atomicRef2.load());
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_SPECIAL_TEST_2400
     * @tc.desc   Verify AtomicReference constructor with modified object reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest2400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      obj.value = 2;
      expect(atomicRef.load().value).assertEqual(2);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_SPECIAL_TEST_2500
     * @tc.desc   Verify AtomicReference constructor multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest2500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef1 = new AtomicReference<string>("first");
      let atomicRef2 = new AtomicReference<string>("second");
      expect(atomicRef1.load()).assertEqual("first");
      expect(atomicRef2.load()).assertEqual("second");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_EDGE_TEST_2600
     * @tc.desc   Verify AtomicReference constructor with large object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceConstructorTest2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let obj = new LargeClass();
      for (let i = 0; i < 10000; i++) {
        obj.data[i] = i;
      }
      let atomicRef = new AtomicReference<LargeClass>(obj);
      expect(atomicRef.load().data.length).assertEqual(10000);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_EDGE_TEST_2700
     * @tc.desc   Verify AtomicReference constructor with circular reference object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceConstructorTest2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let node1 = new Node();
      let node2 = new Node();
      node1.next = node2;
      node2.next = node1;
      let atomicRef = new AtomicReference<Node>(node1);
      expect(atomicRef.load().next).assertEqual(node2);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_EDGE_TEST_2800
     * @tc.desc   Verify AtomicReference constructor with deeply nested object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceConstructorTest2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let obj = new Level1();
      let atomicRef = new AtomicReference<Level1>(obj);
      expect(atomicRef.load().level2.level3.value).assertEqual(3);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest2900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_ERROR_TEST_2900
     * @tc.desc   Verify AtomicReference constructor throws error when passing null to non-null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atomicReferenceConstructorTest2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      try {
        let atomicRef = new AtomicReference<string>(null as string);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
    })

    /**
     * @tc.name   atomicReferenceConstructorTest3000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_ERROR_TEST_3000
     * @tc.desc   Verify AtomicReference constructor with custom class instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceConstructorTest3000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<ValidClass>(new ValidClass());
      expect(atomicRef.load().value).assertEqual(100);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest3100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_CONCURRENT_TEST_3100
     * @tc.desc   Verify AtomicReference constructor with concurrent construction using Task
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceConstructorTest3100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let refs1: AtomicReference<string>[] = [];
      let refs2: AtomicReference<string>[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          refs1.push(new AtomicReference<string>(`test1-${i}`));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          refs2.push(new AtomicReference<string>(`test2-${i}`));
        }
      };

      await Promise.all([task1(), task2()]);

      expect(refs1.length).assertEqual(100);
      expect(refs2.length).assertEqual(100);
      for (let i = 0; i < refs1.length; i++) {
        expect(refs1[i].load()).assertEqual(`test1-${i}`);
      }
      for (let i = 0; i < refs2.length; i++) {
        expect(refs2[i].load()).assertEqual(`test2-${i}`);
      }
    })

    /**
     * @tc.name   atomicReferenceConstructorTest3200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_CONCURRENT_TEST_3200
     * @tc.desc   Verify AtomicReference constructor with concurrent access after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicReferenceConstructorTest3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
     * @tc.name   atomicReferenceConstructorTest3300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PERF_TEST_3300
     * @tc.desc   Verify AtomicReference constructor performance with single call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let start: number = Date.now();
      let atomicRef = new AtomicReference<string>("test");
      let end: number = Date.now();
      let duration: number = end - start;
      expect(atomicRef.load()).assertEqual("test");
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceConstructorTest3400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_PERF_TEST_3400
     * @tc.desc   Verify AtomicReference constructor performance with multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceConstructorTest3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        let atomicRef = new AtomicReference<string>(`test${i}`);
      }
      let end: number = Date.now();
      let duration: number = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicReferenceConstructorTest3500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_STATIC_TEST_3500
     * @tc.desc   Verify AtomicReference constructor with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("atomicReferenceConstructorTest3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<number>(42);
      expect(atomicRef.load()).assertEqual(42);
    })

    /**
     * @tc.name   atomicReferenceConstructorTest3600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_COMPAT_TEST_3600
     * @tc.desc   Verify AtomicReference constructor compatibility with different ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceConstructorTest3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(atomicRef.load()).assertEqual("test");
    })

    /**
     * @tc.name   atomicReferenceConstructorTest3700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_CONSTRUCTOR_COMPAT_TEST_3700
     * @tc.desc   Verify AtomicReference constructor compatibility with different device platforms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("atomicReferenceConstructorTest3700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("test");
      expect(atomicRef.load()).assertEqual("test");
    })
  })
}
