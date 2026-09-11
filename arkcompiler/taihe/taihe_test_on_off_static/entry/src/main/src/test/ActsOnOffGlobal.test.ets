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
import * as on_off from '../ets/on_off'

export default function asyncGlobalTest(): void {
  describe("ActsOnOffGlobalTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_OnOff_FooOn_STATIC_0100
     * @tc.name      test_OnOff_FooOn_Static_0001
     * @tc.desc      on_off.on("foo") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_FooOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_FooOn_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.on("foo", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('on_off.on("foo") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_FooOn_Static_0001 done');
      done();
      console.log('test_OnOff_FooOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_BarOn_STATIC_0100
     * @tc.name      test_OnOff_BarOn_Static_0001
     * @tc.desc      on_off.on("bar") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_BarOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_BarOn_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.on("bar", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('on_off.on("bar") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_BarOn_Static_0001 done');
      done();
      console.log('test_OnOff_BarOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_MyBazOn_STATIC_0100
     * @tc.name      test_OnOff_MyBazOn_Static_0001
     * @tc.desc      on_off.on("my_baz", 1) should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_MyBazOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_MyBazOn_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.on("my_baz", 1, (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('on_off.on("my_baz", 1) failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_MyBazOn_Static_0001 done');
      done();
      console.log('test_OnOff_MyBazOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_FooOff_STATIC_0100
     * @tc.name      test_OnOff_FooOff_Static_0001
     * @tc.desc      on_off.off("foo") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_FooOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_FooOff_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.off("foo", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('on_off.off("foo") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_FooOff_Static_0001 done');
      done();
      console.log('test_OnOff_FooOff_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_BarOff_STATIC_0100
     * @tc.name      test_OnOff_BarOff_Static_0001
     * @tc.desc      on_off.off("bar") should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_BarOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_BarOff_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.off("bar", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('on_off.off("bar") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_BarOff_Static_0001 done');
      done();
      console.log('test_OnOff_BarOff_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_MyBazOff_STATIC_0100
     * @tc.name      test_OnOff_MyBazOff_Static_0001
     * @tc.desc      on_off.off("my_baz", 2) should invoke callback without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_MyBazOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_MyBazOff_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.off("my_baz", 2, (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        pass = false;
        console.log('on_off.off("my_baz", 2) failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_MyBazOff_Static_0001 done');
      done();
      console.log('test_OnOff_MyBazOff_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_UndefinedOn_STATIC_0100
     * @tc.name      test_OnOff_UndefinedOn_Static_0001
     * @tc.desc      on_off.on("ABC") should throw an error for unknown tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_UndefinedOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_UndefinedOn_Static_0001 start');
      let caught: boolean = false;
      try {
        on_off.on("ABC", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.log('test_OnOff_UndefinedOn_Static_0001 done');
      done();
      console.log('test_OnOff_UndefinedOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_UndefinedOff_STATIC_0100
     * @tc.name      test_OnOff_UndefinedOff_Static_0001
     * @tc.desc      on_off.off("ABC") should throw an error for unknown tag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_UndefinedOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_UndefinedOff_Static_0001 start');
      let caught: boolean = false;
      try {
        on_off.off("ABC", (): void => {
          console.log("void input void output callback!");
        });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
      console.log('test_OnOff_UndefinedOff_Static_0001 done');
      done();
      console.log('test_OnOff_UndefinedOff_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_FuncIOn_STATIC_0100
     * @tc.name      test_OnOff_FuncIOn_Static_0001
     * @tc.desc      on_off.on("funcI") should invoke callback with int parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_FuncIOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_FuncIOn_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.on("funcI", (arg0: int): void => {
          console.log("funcI callback with arg:", arg0);
        });
      } catch (e) {
        pass = false;
        console.log('on_off.on("funcI") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_FuncIOn_Static_0001 done');
      done();
      console.log('test_OnOff_FuncIOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_FuncBOn_STATIC_0100
     * @tc.name      test_OnOff_FuncBOn_Static_0001
     * @tc.desc      on_off.on("funcB") should invoke callback with boolean parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_FuncBOn_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_FuncBOn_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.on("funcB", (arg0: boolean): void => {
          console.log("funcB callback with arg:", arg0);
        });
      } catch (e) {
        pass = false;
        console.log('on_off.on("funcB") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_FuncBOn_Static_0001 done');
      done();
      console.log('test_OnOff_FuncBOn_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_FuncIOff_STATIC_0100
     * @tc.name      test_OnOff_FuncIOff_Static_0001
     * @tc.desc      on_off.off("funcI") should invoke callback with int parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_FuncIOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_FuncIOff_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.off("funcI", (arg0: int): void => {
          console.log("funcI callback with arg:", arg0);
        });
      } catch (e) {
        pass = false;
        console.log('on_off.off("funcI") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_FuncIOff_Static_0001 done');
      done();
      console.log('test_OnOff_FuncIOff_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_OnOff_FuncBOff_STATIC_0100
     * @tc.name      test_OnOff_FuncBOff_Static_0001
     * @tc.desc      on_off.off("funcB") should invoke callback with boolean parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_OnOff_FuncBOff_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_OnOff_FuncBOff_Static_0001 start');
      let pass: boolean = true;
      try {
        on_off.off("funcB", (arg0: boolean): void => {
          console.log("funcB callback with arg:", arg0);
        });
      } catch (e) {
        pass = false;
        console.log('on_off.off("funcB") failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_OnOff_FuncBOff_Static_0001 done');
      done();
      console.log('test_OnOff_FuncBOff_Static_0001 end');
    });
  })
}