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
import * as nova from '../ets/nova';
import * as pura from '../ets/pura';
import * as mate from '../ets/mate';
import bar from '../ets/mate';

export default function actsImportNovaTest(): void {
  describe("ActsImportNovaTest", (): void => {
    try {
      loadLibrary("entry")
    } catch (e) {
      console.log('loadFailed', e.message);
    }

    /**
     * @tc.number    SUB_Taihe_ImportNova_FUNC_STATIC_0100
     * @tc.name      test_testBar_0001
     * @tc.desc      nova.testBar native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_testBar_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_testBar_0001 start');
      let bar: bar.BarType = { v: 1 };
      let caught: boolean = true;
      try {
        nova.testBar(bar);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_testBar_0001 done');
      done();
      console.log('test_testBar_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportNova_FUNC_STATIC_0200
     * @tc.name      test_testPura_0001
     * @tc.desc      nova.testPura native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_testPura_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_testPura_0001 start');
      let caught: boolean = true;
      try {
        nova.testPura(pura.PuraType.A);
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_testPura_0001 done');
      done();
      console.log('test_testPura_0001 end');
    });

    /**
     * @tc.number    SUB_Taihe_ImportNova_FUNC_STATIC_0300
     * @tc.name      test_testNova_0001
     * @tc.desc      nova.testNova native function throws not implemented
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_testNova_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('test_testNova_0001 start');
      let caught: boolean = true;
      try {
        nova.testNova({});
      } catch (e) {
        caught = false;
      }
      expect(caught).assertTrue();
      console.log('test_testNova_0001 done');
      done();
      console.log('test_testNova_0001 end');
    });
  })
}