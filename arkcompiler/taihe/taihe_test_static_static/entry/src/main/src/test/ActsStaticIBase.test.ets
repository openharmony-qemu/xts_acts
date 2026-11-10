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
import { describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic";
import {BusinessError} from '@ohos.base';
import * as static_test from '../ets/staticTest';

export default function staticIBaseTest(): void {
  describe("ActsStaticIBaseTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Static_IbaseNewClass_STATIC_0100
     * @tc.name      test_new_class_constructor
     * @tc.desc      Test new IBase("hello") constructor and get() returns "hello"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_new_class_constructor", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_new_class_constructor start');
      let obj: static_test.IBase = new static_test.IBase("hello");
      let result: string = obj.get();
      expect(result).assertEqual("hello");
      console.log('test_new_class_constructor done');
      done();
      console.log('test_new_class_constructor end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseSet_STATIC_0200
     * @tc.name      test_instance_set
     * @tc.desc      Test IBase instance set() updates the value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_instance_set", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_instance_set start');
      let obj: static_test.IBase = new static_test.IBase("hello");
      obj.set("world");
      let result: string = obj.get();
      expect(result).assertEqual("world");
      console.log('test_instance_set done');
      done();
      console.log('test_instance_set end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseSumsync_STATIC_0300
     * @tc.name      test_sumSync
     * @tc.desc      Test IBase.sumSync(10, 20) returns 200 (a * b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_sumSync", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_sumSync start');
      let result: int = static_test.IBase.sumSync(10, 20);
      expect(result).assertEqual(200);
      console.log('test_sumSync done');
      done();
      console.log('test_sumSync end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseAddsync_STATIC_0400
     * @tc.name      test_addSync
     * @tc.desc      Test IBase.addSync(10, 20) returns 30 (a + b)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_addSync", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_addSync start');
      let result: int = static_test.IBase.addSync(10, 20);
      expect(result).assertEqual(30);
      console.log('test_addSync done');
      done();
      console.log('test_addSync end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseAddCallback_STATIC_0500
     * @tc.name      test_add_callback
     * @tc.desc      Test IBase.add(a, b, callback) async callback returns a + b = 30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_add_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_add_callback start');
      try {
      static_test.IBase.add(10, 20, (err: BusinessError | null, data?: int) => {
      if (err) {
      console.error("test_add_callback error: " + err.message);
      } else {
      expect(data).assertEqual(30);
      }
      });
      } catch (error) {
      console.error("test_add_callback exception: " + error);
      }
      console.log('test_add_callback done');
      done();
      console.log('test_add_callback end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseAddPromise_STATIC_0600
     * @tc.name      test_add_promise
     * @tc.desc      Test IBase.add(a, b) promise returns a + b = 30
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_add_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_add_promise start');
      try {
      let p: Promise<int> = static_test.IBase.add(10, 20);
      p.then((res: int) => {
      expect(res).assertEqual(30);
      }).catch((error: Error) => {
      console.error("test_add_promise error: " + error.message);
      });
      } catch (error) {
      console.error("test_add_promise exception: " + error);
      }
      console.log('test_add_promise done');
      done();
      console.log('test_add_promise end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseAddErrorCallback_STATIC_0700
     * @tc.name      test_add_error_callback
     * @tc.desc      Test IBase.add(0, 20) triggers error callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_add_error_callback", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_add_error_callback start');
      try {
      static_test.IBase.add(0, 20, (err: BusinessError | null, data?: int) => {
      if (err) {
      expect(err.code).assertEqual(1);
      }
      });
      } catch (error) {
      console.error("test_add_error_callback exception: " + error);
      }
      console.log('test_add_error_callback done');
      done();
      console.log('test_add_error_callback end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseAddErrorPromise_STATIC_0800
     * @tc.name      test_add_error_promise
     * @tc.desc      Test IBase.add(0, 20) promise rejects with error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_add_error_promise", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_add_error_promise start');
      try {
      let p: Promise<int> = static_test.IBase.add(0, 20);
      p.then((res: int) => {
      console.error("test_add_error_promise should have rejected");
      }).catch((error: Error) => {
      expect(error).not().assertNull();
      });
      } catch (error) {
      console.error("test_add_error_promise exception: " + error);
      }
      console.log('test_add_error_promise done');
      done();
      console.log('test_add_error_promise end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseNameGetter_STATIC_0900
     * @tc.name      test_name_getter
     * @tc.desc      Test IBase.name getter returns "hello ITest"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_name_getter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_name_getter start');
      let val: string = static_test.IBase.name;
      expect(val).assertEqual("hello ITest");
      console.log('test_name_getter done');
      done();
      console.log('test_name_getter end');

    });

    /**
     * @tc.number    SUB_Taihe_Static_IbaseNameSetter_STATIC_1000
     * @tc.name      test_name_setter
     * @tc.desc      Test IBase.name setter updates the value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_name_setter", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_name_setter start');
      static_test.IBase.name = "test";
      let val: string = static_test.IBase.name;
      expect(val).assertEqual("test");
      console.log('test_name_setter done');
      done();
      console.log('test_name_setter end');

    });
  });
}