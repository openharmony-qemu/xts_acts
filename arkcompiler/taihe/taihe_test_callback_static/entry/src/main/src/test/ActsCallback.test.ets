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
import * as test_callback from '../ets/callbackTest'

export default function callbackTest(): void {
  describe("ActsCallbackTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_CallbackCbV_STATIC_0100
     * @tc.name      test_CallbackCbV_Static_0001
     * @tc.desc      TestCbV with void input and void output callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackCbV_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackCbV_Static_0001 start');
      let pass: boolean = true;
      try {
        test_callback.testCbV((): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('testCbV failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackCbV_Static_0001 done');
      done();
      console.log('test_CallbackCbV_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackCbI_STATIC_0100
     * @tc.name      test_CallbackCbI_Static_0001
     * @tc.desc      TestCbI with int input callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackCbI_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackCbI_Static_0001 start');
      test_callback.testCbI((a: int): void => {
        expect(a).assertEqual(1);
      });
      console.log('test_CallbackCbI_Static_0001 done');
      done();
      console.log('test_CallbackCbI_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackCbS_STATIC_0100
     * @tc.name      test_CallbackCbS_Static_0001
     * @tc.desc      TestCbS with string and boolean input callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackCbS_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackCbS_Static_0001 start');
      test_callback.testCbS((a: string, b: boolean): void => {
        if (b) {
          expect(a).assertEqual("hello");
        }
      });
      console.log('test_CallbackCbS_Static_0001 done');
      done();
      console.log('test_CallbackCbS_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackCbRs_STATIC_0100
     * @tc.name      test_CallbackCbRs_Static_0001
     * @tc.desc      TestCbRs with callback returning string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackCbRs_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackCbRs_Static_0001 start');
      let result = test_callback.testCbRs((a: string): string => {
        return "my return value";
      });
      expect(result).assertEqual("my return value");
      console.log('test_CallbackCbRs_Static_0001 done');
      done();
      console.log('test_CallbackCbRs_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackCbStruct_STATIC_0100
     * @tc.name      test_CallbackCbStruct_Static_0001
     * @tc.desc      TestCbStruct with struct input callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackCbStruct_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackCbStruct_Static_0001 start');
      test_callback.testCbStruct((a: test_callback.Data): test_callback.Data => {
        let data: test_callback.Data = {a: (a.a + "main"), b: (a.b + "main"), c: (a.c + 100)};
        expect(data.a).assertEqual("amain");
        expect(data.b).assertEqual("bmain");
        expect(data.c).assertEqual(101);
        return data;
      });
      console.log('test_CallbackCbStruct_Static_0001 done');
      done();
      console.log('test_CallbackCbStruct_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackIntString_STATIC_0100
     * @tc.name      test_CallbackIntString_Static_0001
     * @tc.desc      MyInterface TestCbIntString with i8 and i32 input callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackIntString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackIntString_Static_0001 start');
      let instance: test_callback.MyInterface = test_callback.getInterface();
      let result = instance.testCbIntString((a: byte, b: int): void => {
        expect(a).assertEqual((10).toByte());
        expect(b).assertEqual(100);
      });
      expect(result).assertEqual("testCbIntString");
      console.log('test_CallbackIntString_Static_0001 done');
      done();
      console.log('test_CallbackIntString_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackIntBool_STATIC_0100
     * @tc.name      test_CallbackIntBool_Static_0001
     * @tc.desc      MyInterface TestCbIntBool with i16 and i64 input callback
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackIntBool_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackIntBool_Static_0001 start');
      let instance: test_callback.MyInterface = test_callback.getInterface();
      let result = instance.testCbIntBool((a: short, b: long): void => {
        expect(a).assertEqual((100).toShort());
        expect(b).assertEqual((1000000000).toLong());
      });
      expect(result).assertTrue();
      console.log('test_CallbackIntBool_Static_0001 done');
      done();
      console.log('test_CallbackIntBool_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackEnum_STATIC_0100
     * @tc.name      test_CallbackEnum_Static_0001
     * @tc.desc      MyInterface TestCbEnum with i32 input callback returning EnumData
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackEnum_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackEnum_Static_0001 start');
      let instance: test_callback.MyInterface = test_callback.getInterface();
      let result = instance.testCbEnum((a: int): void => {
        expect(a).assertEqual(10);
      });
      expect(result.toString()).assertEqual("123");
      console.log('test_CallbackEnum_Static_0001 done');
      done();
      console.log('test_CallbackEnum_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackGetVoid_STATIC_0100
     * @tc.name      test_CallbackGetVoid_Static_0001
     * @tc.desc      GetCallbackVoid returns a void callback from native
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackGetVoid_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackGetVoid_Static_0001 start');
      let pass: boolean = true;
      try {
        let cb: () => void = test_callback.getCallbackVoid();
        cb();
      } catch (e) {
        pass = false;
        console.log('getCallbackVoid failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_CallbackGetVoid_Static_0001 done');
      done();
      console.log('test_CallbackGetVoid_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_CallbackGetString_STATIC_0100
     * @tc.name      test_CallbackGetString_Static_0001
     * @tc.desc      GetCallbackString returns a string callback from native
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_CallbackGetString_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_CallbackGetString_Static_0001 start');
      let cb: () => string = test_callback.getCallbackString();
      let result = cb();
      expect(result).assertEqual("callback result: captured variable");
      console.log('test_CallbackGetString_Static_0001 done');
      done();
      console.log('test_CallbackGetString_Static_0001 end');
    });
  })
}