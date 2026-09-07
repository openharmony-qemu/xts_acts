'use static';
/**
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index";
import Utils from '../common/Utils';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { LibUtil } from '../../../ets/pages/LibUtil';

const libUtil: LibUtil = new LibUtil();



export default function PointerEventTest(){
  describe('PointerEventTest',  () =>{
    afterEach(async (): Promise<void> => {
      try {
        await Utils.sleep(100)
      } catch (err) {
        console.info('PointerEventTest afterEach err: ' + JSON.stringify(err));
      }
    })

    /**
     * @tc.number   PointerEventTest_a
     * @tc.name     PointerEventTest_a
     * @tc.desc     PointerEventTest_a
     * @tc.level    Level.LEVEL0
     */
    it('PointerEventTest_a', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        expect(libUtil.PointerEventTest_a()).assertEqual(0)
        console.log('PointerEventTest_a will drag and check:: ')
        await Utils.sleep(200)

        done()
      } catch (err) {
        console.info('PointerEventTest_a err: ' + JSON.stringify(err));
        done();
      }
    })


    /**
     * @tc.number   PointerEventTest_b
     * @tc.name     PointerEventTest_b
     * @tc.desc     PointerEventTest_b
     * @tc.level    Level.LEVEL0
     */
    it('PointerEventTest_b', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        expect(libUtil.PointerEventTest_b()).assertEqual(0)
        console.log('PointerEventTest_b will drag and check:: ')
        await Utils.sleep(200)

        done()
      } catch (err) {
        console.info('PointerEventTest_b err: ' + JSON.stringify(err));
        done();
      }
    })

    /**
     * @tc.number   PointerEventTest_b1
     * @tc.name     PointerEventTest_b1
     * @tc.desc     PointerEventTest_b1
     * @tc.level    Level.LEVEL0
     */
    it('PointerEventTest_b1', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        expect(libUtil.PointerEventTest_b1()).assertEqual(0)
        console.log('PointerEventTest_b1 will drag and check:: ')
        await Utils.sleep(200)

        done()
      } catch (err) {
        console.info('PointerEventTest_b1 err: ' + JSON.stringify(err));
        done();
      }
    })
  })
}
