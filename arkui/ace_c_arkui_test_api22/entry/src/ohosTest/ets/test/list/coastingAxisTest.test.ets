/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, beforeEach, Level } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import nativeRender from 'libnativerender.so'
import Utils from '../common/Utils';


export default function CoastingAxisTest(){
  describe('CoastingAxisTest',  () =>{

    afterEach(async (done: Function) => {
      await Utils.sleep(100)
      done()
    })
    /**
     * @tc.name   CoastingAxisTest_a
     * @tc.number CoastingAxisTest001
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CoastingAxisTest_a',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CoastingAxisTest_a()).assertEqual(0)
      console.log('CoastingAxisEventTest_a End')
      await Utils.sleep(200)
      done()
    })
    /**
     * @tc.name   CoastingAxisTest_b
     * @tc.number CoastingAxisTest002
     * @tc.desc   Test the alt interface to set normal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('CoastingAxisTest_b',  Level.LEVEL0, async (done: Function) => {
      expect(nativeRender.CoastingAxisTest_b()).assertEqual(0)
      console.log('CoastingAxisEventTest_b End')
      await Utils.sleep(200)
      done()
    })
  })
}