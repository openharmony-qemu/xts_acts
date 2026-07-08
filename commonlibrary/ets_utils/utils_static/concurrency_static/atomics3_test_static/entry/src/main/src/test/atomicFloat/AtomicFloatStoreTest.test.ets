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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

interface StoreNoParam {
  store: () => void;
}

interface StoreObjectParam {
  store: (a: Object) => void;
}

interface StoreIntParam {
  store: (a: int) => void;
}

export default function AtomicFloatStoreTest(): void {
  describe("AtomicFloatStoreTest", (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicFloatStore0100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0100
     * @tc.desc   Verify AtomicFloat.store() with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatStore0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      atomicFloat.store(Double.toFloat(2.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   testAtomicFloatStore0200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0200
     * @tc.desc   Verify AtomicFloat.store() throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatStore0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;
      try {
        let obj: Object = atomicFloat;
        let storeFunc = obj as StoreNoParam;
        storeFunc.store();
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatStore0300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0300
     * @tc.desc   Verify AtomicFloat.store() with normal float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatStore0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      atomicFloat.store(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   testAtomicFloatStore0400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0400
     * @tc.desc   Verify AtomicFloat.store() with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatStore0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(0.0));
    })

    /**
     * @tc.name   testAtomicFloatStore0500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0500
     * @tc.desc   Verify AtomicFloat.store() with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatStore0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Double.toFloat(-50.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-50.5));
    })

    /**
     * @tc.name   testAtomicFloatStore0600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0600
     * @tc.desc   Verify AtomicFloat.store() with Float.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatStore0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Float.POSITIVE_INFINITY);
      expect(atomicFloat.load()).assertEqual(Float.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   testAtomicFloatStore0700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0700
     * @tc.desc   Verify AtomicFloat.store() with Float.NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatStore0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Float.NaN);
      expect(isNaN(atomicFloat.load())).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatStore0800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0800
     * @tc.desc   Verify AtomicFloat.store() with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatStore0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;
      try {
        let obj: Object = atomicFloat;
        let storeFunc = obj as StoreObjectParam;
        storeFunc.store(null as Object);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatStore0900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_PARAM_TEST_0900
     * @tc.desc   Verify AtomicFloat.store() with integer parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatStore0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;
      try {
        let obj: Object = atomicFloat;
        let storeFunc = obj as StoreIntParam;
        storeFunc.store(10);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatStore1000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_RETURN_TEST_1000
     * @tc.desc   Verify AtomicFloat.store() returns void undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatStore1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let result = atomicFloat.store(Double.toFloat(2.5));
      expect(result).assertEqual(undefined);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   testAtomicFloatStore1100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_RETURN_TEST_1100
     * @tc.desc   Verify AtomicFloat.store() overwrites old value with new value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatStore1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      atomicFloat.store(Double.toFloat(2.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
      atomicFloat.store(Double.toFloat(3.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(3.5));
    })

    /**
     * @tc.name   testAtomicFloatStore1200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_CONCURRENT_TEST_1200
     * @tc.desc   Verify AtomicFloat.store() atomicity with concurrent writes from multiple tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatStore1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicFloat.store(Double.toFloat(1.5));
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicFloat.store(Double.toFloat(2.5));
        }
      };
      await Promise.all([task1(), task2()]);
      let finalValue = atomicFloat.load();
      expect(finalValue === Double.toFloat(1.5) || finalValue === Double.toFloat(2.5)).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatStore1300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_STATE_TEST_1300
     * @tc.desc   Verify AtomicFloat.store() updates state flag from 0.0 to 1.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatStore1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let status = new AtomicFloat(Double.toFloat(0.0));
      status.store(Double.toFloat(1.0));
      expect(status.load()).assertEqual(Double.toFloat(1.0));
    })

    /**
     * @tc.name   testAtomicFloatStore1400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_SPECIAL_TEST_1400
     * @tc.desc   Verify AtomicFloat.store() with Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatStore1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Float.MIN_VALUE);
      expect(atomicFloat.load()).assertEqual(Float.MIN_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatStore1500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_SPECIAL_TEST_1500
     * @tc.desc   Verify AtomicFloat.store() with Float.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatStore1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Float.MAX_VALUE);
      expect(atomicFloat.load()).assertEqual(Float.MAX_VALUE);
    })

    /**
     * @tc.name   testAtomicFloatStore1600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_STORE_SPECIAL_TEST_1600
     * @tc.desc   Verify AtomicFloat.store() with Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatStore1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Float.EPSILON);
      expect(atomicFloat.load()).assertEqual(Float.EPSILON);
    })
  })
}
