'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import * as test from '../ets/Index'

class MyObjectImpl implements test.MyObject {
  invoke(): void {
    console.log("MyObjectImpl::invoke() called");
  }
}

export default function consistencyTest(): void {
  describe("ActsConsistencyTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC1_STATIC_0100
     * @tc.name      test_ObjectConsistency_Static_0001
     * @tc.desc      MyObjectContainer save and take returns the same object (identity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectConsistency_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ObjectConsistency_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createObjectContainer();
        let obj = new MyObjectImpl();
        container.save(obj);
        let takenObj = container.take();
        expect(takenObj).assertEqual(obj);
      } catch (e) {
        pass = false;
        console.log('ObjectConsistency failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_ObjectConsistency_Static_0001 done');
      done();
      console.log('test_ObjectConsistency_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC2_STATIC_0100
     * @tc.name      test_CallbackConsistency_Static_0001
     * @tc.desc      MyCallbackContainer save and take returns the same callback (identity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackConsistency_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackConsistency_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createCallbackContainer();
        let callback = (s: string): void => {
          console.log("Callback called with: " + s);
        };
        container.save(callback);
        let takenCallback = container.take();
        expect(takenCallback).assertEqual(callback);
      } catch (e) {
        pass = false;
        console.log('CallbackConsistency failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackConsistency_Static_0001 done');
      done();
      console.log('test_CallbackConsistency_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC3_STATIC_0100
     * @tc.name      test_ObjectTakeEmpty_Static_0001
     * @tc.desc      MyObjectContainer take from empty container returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectTakeEmpty_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ObjectTakeEmpty_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createObjectContainer();
        let takenObj = container.take();
        expect(takenObj).assertUndefined();
      } catch (e) {
        pass = false;
        console.log('ObjectTakeEmpty failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_ObjectTakeEmpty_Static_0001 done');
      done();
      console.log('test_ObjectTakeEmpty_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC4_STATIC_0100
     * @tc.name      test_CallbackTakeEmpty_Static_0001
     * @tc.desc      MyCallbackContainer take from empty container returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackTakeEmpty_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackTakeEmpty_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createCallbackContainer();
        let takenCallback = container.take();
        expect(takenCallback).assertUndefined();
      } catch (e) {
        pass = false;
        console.log('CallbackTakeEmpty failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackTakeEmpty_Static_0001 done');
      done();
      console.log('test_CallbackTakeEmpty_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC5_STATIC_0100
     * @tc.name      test_ObjectTakeAfterTake_Static_0001
     * @tc.desc      MyObjectContainer take after previous take returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectTakeAfterTake_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ObjectTakeAfterTake_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createObjectContainer();
        let obj = new MyObjectImpl();
        container.save(obj);
        let takenObj1 = container.take();
        expect(takenObj1).assertEqual(obj);
        let takenObj2 = container.take();
        expect(takenObj2).assertUndefined();
      } catch (e) {
        pass = false;
        console.log('ObjectTakeAfterTake failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_ObjectTakeAfterTake_Static_0001 done');
      done();
      console.log('test_ObjectTakeAfterTake_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC6_STATIC_0100
     * @tc.name      test_CallbackTakeAfterTake_Static_0001
     * @tc.desc      MyCallbackContainer take after previous take returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackTakeAfterTake_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackTakeAfterTake_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createCallbackContainer();
        let callback = (s: string): void => {
          console.log("Callback called with: " + s);
        };
        container.save(callback);
        let takenCallback1 = container.take();
        expect(takenCallback1).assertEqual(callback);
        let takenCallback2 = container.take();
        expect(takenCallback2).assertUndefined();
      } catch (e) {
        pass = false;
        console.log('CallbackTakeAfterTake failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackTakeAfterTake_Static_0001 done');
      done();
      console.log('test_CallbackTakeAfterTake_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC7_STATIC_0100
     * @tc.name      test_ObjectOverride_Static_0001
     * @tc.desc      MyObjectContainer save overwrites previous object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectOverride_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ObjectOverride_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createObjectContainer();
        let obj1 = new MyObjectImpl();
        let obj2 = new MyObjectImpl();
        container.save(obj1);
        container.save(obj2);
        let takenObj = container.take();
        expect(takenObj).assertEqual(obj2);
      } catch (e) {
        pass = false;
        console.log('ObjectOverride failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_ObjectOverride_Static_0001 done');
      done();
      console.log('test_ObjectOverride_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC8_STATIC_0100
     * @tc.name      test_CallbackOverride_Static_0001
     * @tc.desc      MyCallbackContainer save overwrites previous callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackOverride_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackOverride_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createCallbackContainer();
        let callback1 = (s: string): void => {
          console.log("Callback 1 called with: " + s);
        };
        let callback2 = (s: string): void => {
          console.log("Callback 2 called with: " + s);
        };
        container.save(callback1);
        container.save(callback2);
        let takenCallback = container.take();
        expect(takenCallback).assertEqual(callback2);
      } catch (e) {
        pass = false;
        console.log('CallbackOverride failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackOverride_Static_0001 done');
      done();
      console.log('test_CallbackOverride_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC9_STATIC_0100
     * @tc.name      test_ObjectSaveTakeSaveTake_Static_0001
     * @tc.desc      MyObjectContainer multiple save-take cycles
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ObjectSaveTakeSaveTake_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_ObjectSaveTakeSaveTake_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createObjectContainer();
        let obj1 = new MyObjectImpl();
        container.save(obj1);
        let taken1 = container.take();
        expect(taken1).assertEqual(obj1);

        let obj2 = new MyObjectImpl();
        container.save(obj2);
        let taken2 = container.take();
        expect(taken2).assertEqual(obj2);
      } catch (e) {
        pass = false;
        console.log('ObjectSaveTakeSaveTake failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_ObjectSaveTakeSaveTake_Static_0001 done');
      done();
      console.log('test_ObjectSaveTakeSaveTake_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_Consistency_FUNC10_STATIC_0100
     * @tc.name      test_CallbackSaveTakeSaveTake_Static_0001
     * @tc.desc      MyCallbackContainer multiple save-take cycles
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackSaveTakeSaveTake_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackSaveTakeSaveTake_Static_0001 start');
      let pass: boolean = true;
      try {
        let container = test.createCallbackContainer();
        let callback1 = (s: string): void => {
          console.log("Callback 1 called with: " + s);
        };
        container.save(callback1);
        let taken1 = container.take();
        expect(taken1).assertEqual(callback1);

        let callback2 = (s: string): void => {
          console.log("Callback 2 called with: " + s);
        };
        container.save(callback2);
        let taken2 = container.take();
        expect(taken2).assertEqual(callback2);
      } catch (e) {
        pass = false;
        console.log('CallbackSaveTakeSaveTake failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackSaveTakeSaveTake_Static_0001 done');
      done();
      console.log('test_CallbackSaveTakeSaveTake_Static_0001 end');
    });
  });
}