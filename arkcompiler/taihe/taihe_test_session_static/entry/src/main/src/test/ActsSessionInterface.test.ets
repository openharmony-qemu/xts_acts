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
import * as session_test from '../ets/session_test';
import {IfaceD, IfaceE} from '../ets/session_test';

export default function sessionInterfaceTest(): void {
  describe("ActsSessionInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }


    /**
     * @tc.number    SUB_Taihe_Session_InterfaceFuncA_STATIC_0100
     * @tc.name      test_ifaceD_func_a
     * @tc.desc      Test IfaceD.func_a() inherited from IfaceA returns "a"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceD_func_a", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceD_func_a start');
      let obj: IfaceD = session_test.getIfaceD();
      let result: string = obj.func_a();
      expect(result).assertEqual("a");
      console.log('test_ifaceD_func_a done');
      done();
      console.log('test_ifaceD_func_a end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceFuncB_STATIC_0200
     * @tc.name      test_ifaceD_func_b
     * @tc.desc      Test IfaceD.func_b() inherited from IfaceB returns "b"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceD_func_b", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceD_func_b start');
      let obj: IfaceD = session_test.getIfaceD();
      let result: string = obj.func_b();
      expect(result).assertEqual("b");
      console.log('test_ifaceD_func_b done');
      done();
      console.log('test_ifaceD_func_b end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceFuncC_STATIC_0300
     * @tc.name      test_ifaceD_func_c
     * @tc.desc      Test IfaceD.func_c() inherited from IfaceC returns "c"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceD_func_c", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceD_func_c start');
      let obj: IfaceD = session_test.getIfaceD();
      let result: string = obj.func_c();
      expect(result).assertEqual("c");
      console.log('test_ifaceD_func_c done');
      done();
      console.log('test_ifaceD_func_c end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceFuncD_STATIC_0400
     * @tc.name      test_ifaceD_func_d
     * @tc.desc      Test IfaceD.func_d() returns "d" and name getter/setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceD_func_d", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceD_func_d start');
      let obj: IfaceD = session_test.getIfaceD();
      let result: string = obj.func_d();
      expect(result).assertEqual("d");
      expect(obj.name).assertEqual("IfaceD");
      obj.name = "new name";
      expect(obj.name).assertEqual("new name");
      console.log('test_ifaceD_func_d done');
      done();
      console.log('test_ifaceD_func_d end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceOnSet_STATIC_0500
     * @tc.name      test_ifaceD_on_set
     * @tc.desc      Test IfaceD.on("set") tag dispatch to onSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceD_on_set", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceD_on_set start');
      let obj: IfaceD = session_test.getIfaceD();
      let caught: boolean = true;
      try {
      obj.on("set", () => {
      console.log("void input void output callback!");
      });
      } catch (error) {
      caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_ifaceD_on_set done');
      done();
      console.log('test_ifaceD_on_set end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceOffSet_STATIC_0600
     * @tc.name      test_ifaceD_off_set
     * @tc.desc      Test IfaceD.off("set") tag dispatch to offSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceD_off_set", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceD_off_set start');
      let obj: IfaceD = session_test.getIfaceD();
      let caught: boolean = true;
      try {
        obj.off("set", () => {
          console.log("void input void output callback!");
        });
      } catch (error) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_ifaceD_off_set done');
      done();
      console.log('test_ifaceD_off_set end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceIfaceeFuncA_STATIC_0700
     * @tc.name      test_ifaceE_func_a
     * @tc.desc      Test IfaceE.func_a() returns "aa"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceE_func_a", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceE_func_a start');
      let obj: IfaceE = session_test.getIfaceE();
      let result: string = obj.func_a();
      expect(result).assertEqual("aa");
      console.log('test_ifaceE_func_a done');
      done();
      console.log('test_ifaceE_func_a end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceIfaceeFuncB_STATIC_0800
     * @tc.name      test_ifaceE_func_b
     * @tc.desc      Test IfaceE.func_b() returns "bb"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceE_func_b", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceE_func_b start');
      let obj: IfaceE = session_test.getIfaceE();
      let result: string = obj.func_b();
      expect(result).assertEqual("bb");
      console.log('test_ifaceE_func_b done');
      done();
      console.log('test_ifaceE_func_b end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceIfaceeFuncC_STATIC_0900
     * @tc.name      test_ifaceE_func_c
     * @tc.desc      Test IfaceE.func_c() returns "cc"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceE_func_c", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceE_func_c start');
      let obj: IfaceE = session_test.getIfaceE();
      let result: string = obj.func_c();
      expect(result).assertEqual("cc");
      console.log('test_ifaceE_func_c done');
      done();
      console.log('test_ifaceE_func_c end');

    });

    /**
     * @tc.number    SUB_Taihe_Session_InterfaceIfaceeFuncE_STATIC_1000
     * @tc.name      test_ifaceE_func_e
     * @tc.desc      Test IfaceE.func_e() returns "ee"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
    */
    it("test_ifaceE_func_e", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,

      async (done: () => void): Promise<void> => {
      console.log('test_ifaceE_func_e start');
      let obj: IfaceE = session_test.getIfaceE();
      let result: string = obj.func_e();
      expect(result).assertEqual("ee");
      console.log('test_ifaceE_func_e done');
      done();
      console.log('test_ifaceE_func_e end');

    });
  });
}