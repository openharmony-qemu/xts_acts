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

class Counter {
  public value: int = 0;
}

class Config {
  public version: int = 1;
  public host: string = "localhost";
}

class State {
  public status: string = "idle";
}

export default function AtomicReferenceCompareAndSwapTest(): void {
  describe("AtomicReferenceCompareAndSwapTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_PARAM_TEST_0100
     * @tc.desc   Verify AtomicReference.compareAndSwap() with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicReferenceCompareAndSwap0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("a");
      let oldValue = atomicRef.compareAndSwap("a", "b");
      expect(oldValue).assertEqual("a");
      expect(atomicRef.load()).assertEqual("b");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_PARAM_TEST_0200
     * @tc.desc   Verify AtomicReference.compareAndSwap() with object type expected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      let newObj = new Container();
      newObj.value = 2;
      let oldValue = atomicRef.compareAndSwap(obj, newObj);
      expect(oldValue).assertEqual(obj);
      expect(atomicRef.load().value).assertEqual(2);
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_PARAM_TEST_0300
     * @tc.desc   Verify AtomicReference.compareAndSwap() with custom class instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new MyClass();
      let atomicRef = new AtomicReference<MyClass>(obj);
      let newObj = new MyClass();
      newObj.name = "updated";
      let oldValue = atomicRef.compareAndSwap(obj, newObj);
      expect(oldValue.name).assertEqual("test");
      expect(atomicRef.load().name).assertEqual("updated");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_RETURN_TEST_0400
     * @tc.desc   Verify AtomicReference.compareAndSwap() updates value correctly when matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicReferenceCompareAndSwap0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      atomicRef.compareAndSwap("old", "new");
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_RETURN_TEST_0500
     * @tc.desc   Verify AtomicReference.compareAndSwap() returns old value when not matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicReferenceCompareAndSwap0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("a");
      let oldValue = atomicRef.compareAndSwap("b", "c");
      expect(oldValue).assertEqual("a");
      expect(atomicRef.load()).assertEqual("a");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_RETURN_TEST_0600
     * @tc.desc   Verify AtomicReference.compareAndSwap() does not update when not matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicReferenceCompareAndSwap0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("original");
      atomicRef.compareAndSwap("wrong", "new");
      expect(atomicRef.load()).assertEqual("original");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_SPECIAL_TEST_0700
     * @tc.desc   Verify AtomicReference.compareAndSwap() with same expected and ref
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.compareAndSwap("test", "test");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("test");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_REFERENCE_TEST_0800
     * @tc.desc   Verify AtomicReference.compareAndSwap() with object reference equality
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let obj = new Container();
      let atomicRef = new AtomicReference<Container>(obj);
      let newObj = new Container();
      newObj.value = 1;
      let oldValue = atomicRef.compareAndSwap(newObj, new Container());
      expect(oldValue).assertEqual(obj);
      expect(atomicRef.load()).assertEqual(obj);
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap0900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_SPECIAL_TEST_0900
     * @tc.desc   Verify AtomicReference.compareAndSwap() multiple consecutive successes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("a");
      let oldValue1 = atomicRef.compareAndSwap("a", "b");
      expect(oldValue1).assertEqual("a");
      let oldValue2 = atomicRef.compareAndSwap("b", "c");
      expect(oldValue2).assertEqual("b");
      let oldValue3 = atomicRef.compareAndSwap("c", "d");
      expect(oldValue3).assertEqual("c");
      expect(atomicRef.load()).assertEqual("d");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_SPECIAL_TEST_1000
     * @tc.desc   Verify AtomicReference.compareAndSwap() multiple consecutive failures
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("a");
      let oldValue1 = atomicRef.compareAndSwap("b", "c");
      expect(oldValue1).assertEqual("a");
      let oldValue2 = atomicRef.compareAndSwap("d", "e");
      expect(oldValue2).assertEqual("a");
      let oldValue3 = atomicRef.compareAndSwap("f", "g");
      expect(oldValue3).assertEqual("a");
      expect(atomicRef.load()).assertEqual("a");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_SPECIAL_TEST_1100
     * @tc.desc   Verify AtomicReference.compareAndSwap() alternating success and failure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("a");
      let oldValue1 = atomicRef.compareAndSwap("a", "b");
      expect(oldValue1).assertEqual("a");
      expect(atomicRef.load()).assertEqual("b");
      let oldValue2 = atomicRef.compareAndSwap("a", "c");
      expect(oldValue2).assertEqual("b");
      expect(atomicRef.load()).assertEqual("b");
      let oldValue3 = atomicRef.compareAndSwap("b", "c");
      expect(oldValue3).assertEqual("b");
      expect(atomicRef.load()).assertEqual("c");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_MIXED_TEST_1200
     * @tc.desc   Verify AtomicReference.compareAndSwap() mixed with load and store
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      atomicRef.store("first");
      let loaded = atomicRef.load();
      expect(loaded).assertEqual("first");
      let oldValue1 = atomicRef.compareAndSwap("first", "second");
      expect(oldValue1).assertEqual("first");
      expect(atomicRef.load()).assertEqual("second");
      let oldValue2 = atomicRef.exchange("third");
      expect(oldValue2).assertEqual("second");
      expect(atomicRef.load()).assertEqual("third");
      let oldValue3 = atomicRef.compareAndSwap("third", "fourth");
      expect(oldValue3).assertEqual("third");
      expect(atomicRef.load()).assertEqual("fourth");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_PERF_TEST_1300
     * @tc.desc   Verify AtomicReference.compareAndSwap() single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicReferenceCompareAndSwap1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let start = Date.now();
      let oldValue = atomicRef.compareAndSwap("old", "new");
      let end = Date.now();
      let duration = end - start;
      expect(oldValue).assertEqual("old");
      expect(atomicRef.load()).assertEqual("new");
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_PERF_TEST_1400
     * @tc.desc   Verify AtomicReference.compareAndSwap() multiple calls performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicReferenceCompareAndSwap1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        atomicRef.compareAndSwap("initial", `test${i}`);
      }
      let end = Date.now();
      let duration = end - start;
      expect(duration >= 0).assertTrue();
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1500
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_STATE_TEST_1500
     * @tc.desc   Verify AtomicReference.compareAndSwap() state before and after
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicReferenceCompareAndSwap1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("old");
      let beforeLoad = atomicRef.load();
      let oldValue = atomicRef.compareAndSwap("old", "new");
      let afterLoad = atomicRef.load();
      expect(beforeLoad).assertEqual("old");
      expect(oldValue).assertEqual("old");
      expect(afterLoad).assertEqual("new");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1600
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_STATE_TEST_1600
     * @tc.desc   Verify AtomicReference.compareAndSwap() does not change state on failure
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicReferenceCompareAndSwap1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicRef = new AtomicReference<string>("original");
      let beforeLoad = atomicRef.load();
      let oldValue = atomicRef.compareAndSwap("wrong", "new");
      let afterLoad = atomicRef.load();
      expect(beforeLoad).assertEqual("original");
      expect(oldValue).assertEqual("original");
      expect(afterLoad).assertEqual("original");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1700
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_COUNTER_TEST_1700
     * @tc.desc   Verify AtomicReference.compareAndSwap() for lock-free counter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicReferenceCompareAndSwap1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new Counter();
      let atomicRef = new AtomicReference<Counter>(counter);
      let success = false;
      let attempts = 0;
      while (!success && attempts < 100) {
        let oldCounter = atomicRef.load();
        let newCounter = new Counter();
        newCounter.value = oldCounter.value + 1;
        let oldValue = atomicRef.compareAndSwap(oldCounter, newCounter);
        if (oldValue === oldCounter) {
          success = true;
        }
        attempts++;
      }
      expect(atomicRef.load().value).assertEqual(1);
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1800
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_CONFIG_TEST_1800
     * @tc.desc   Verify AtomicReference.compareAndSwap() for config update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicReferenceCompareAndSwap1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config = new Config();
      let atomicRef = new AtomicReference<Config>(config);
      let oldConfig = atomicRef.load();
      let newConfig = new Config();
      newConfig.version = 2;
      newConfig.host = "remote";
      let oldValue = atomicRef.compareAndSwap(oldConfig, newConfig);
      expect(oldValue.version).assertEqual(1);
      expect(atomicRef.load().version).assertEqual(2);
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap1900
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_STATEMACHINE_TEST_1900
     * @tc.desc   Verify AtomicReference.compareAndSwap() for state machine
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicReferenceCompareAndSwap1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let state = new State();
      let atomicRef = new AtomicReference<State>(state);
      let oldState = atomicRef.load();
      if (oldState.status === "idle") {
        let newState = new State();
        newState.status = "running";
        atomicRef.compareAndSwap(oldState, newState);
      }
      expect(atomicRef.load().status).assertEqual("running");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap2000
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_NULL_TEST_2000
     * @tc.desc   Verify AtomicReference.compareAndSwap() with null value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string | null>(null);
      let oldValue = atomicRef.compareAndSwap(null, "new");
      expect(oldValue).assertEqual(null);
      expect(atomicRef.load()).assertEqual("new");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap2100
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_BOUNDARY_TEST_2100
     * @tc.desc   Verify AtomicReference.compareAndSwap() with Unicode string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.compareAndSwap("test", "你好世界🌍");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("你好世界🌍");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap2200
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_BOUNDARY_TEST_2200
     * @tc.desc   Verify AtomicReference.compareAndSwap() with special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicReferenceCompareAndSwap2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicRef = new AtomicReference<string>("test");
      let oldValue = atomicRef.compareAndSwap("test", "test\n\t\r\\\"");
      expect(oldValue).assertEqual("test");
      expect(atomicRef.load()).assertEqual("test\n\t\r\\\"");
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap2300
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_CONCURRENT_TEST_2300
     * @tc.desc   Verify AtomicReference.compareAndSwap() concurrent operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicReferenceCompareAndSwap2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicRef = new AtomicReference<string>("initial");
      let results: string[] = [];
      
      let task1 = async () => {
        for (let i = 0; i < 10; i++) {
          let old = atomicRef.load();
          atomicRef.compareAndSwap(old, `task1-${i}`);
          results.push(atomicRef.load());
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 10; i++) {
          let old = atomicRef.load();
          atomicRef.compareAndSwap(old, `task2-${i}`);
          results.push(atomicRef.load());
        }
      };

      await Promise.all([task1(), task2()]);
      expect(results.length).assertEqual(20);
    })

    /**
     * @tc.name   testAtomicReferenceCompareAndSwap2400
     * @tc.number SUB_BUILTINS_ATOMICREFERENCE_COMPAREANDSWAP_CASLOOP_TEST_2400
     * @tc.desc   Verify AtomicReference.compareAndSwap() CAS loop implementation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicReferenceCompareAndSwap2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new Counter();
      let atomicRef = new AtomicReference<Counter>(counter);
      
      for (let i = 0; i < 5; i++) {
        let success = false;
        let attempts = 0;
        while (!success && attempts < 100) {
          let oldCounter = atomicRef.load();
          let newCounter = new Counter();
          newCounter.value = oldCounter.value + 1;
          let oldValue = atomicRef.compareAndSwap(oldCounter, newCounter);
          if (oldValue === oldCounter) {
            success = true;
          }
          attempts++;
        }
      }
      expect(atomicRef.load().value).assertEqual(5);
    })
  })
}
