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
import * as test_async from '../ets/async_test'

export default function asyncInterfaceTest(): void {
  describe("ActsAsyncInterfaceTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    let ibase: test_async.IBase = test_async.getIBase();

    /**
     * @tc.number    SUB_Taihe_IBaseGet_STATIC_0100
     * @tc.name      test_IBaseGet_Static_0001
     * @tc.desc      IBase.get() should return 'My IBase'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IBaseGet_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_IBaseGet_Static_0001 start');
      expect(ibase.get()).assertEqual("My IBase");
      console.log('test_IBaseGet_Static_0001 done');
      done();
      console.log('test_IBaseGet_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_IBaseSetGetPromise_STATIC_0100
     * @tc.name      test_IBaseSetGetPromise_Static_0001
     * @tc.desc      getReturnsPromise should resolve with the value set by setReturnsPromise
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IBaseSetGetPromise_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_IBaseSetGetPromise_Static_0001 start');
      await ibase.setString("interface async set");
      let s: string = await ibase.getString();
      expect(s).assertEqual("interface async set");
      console.log('test_IBaseSetGetPromise_Static_0001 done');
      done();
      console.log('test_IBaseSetGetPromise_Static_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_IBaseStaticPrint_STATIC_0100
     * @tc.name      test_IBaseStaticPrint_Static_0001
     * @tc.desc      IBase static print promise should resolve without error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IBaseStaticPrint_Static_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_IBaseStaticPrint_Static_0001 start');
      let pass: boolean = true;
      try {
        await test_async.IBase.print();
      } catch (e) {
        pass = false;
        console.log('IBase.print failed', e.message);
      }
      expect(pass).assertTrue();
      console.log('test_IBaseStaticPrint_Static_0001 done');
      done();
      console.log('test_IBaseStaticPrint_Static_0001 end');
    });
  })
}