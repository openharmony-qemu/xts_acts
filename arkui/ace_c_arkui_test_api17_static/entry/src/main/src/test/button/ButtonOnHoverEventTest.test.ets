'use static';
/*
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

import { describe, beforeEach, it, expect, Level } from "@ohos/hypium-static/src/main/indexStatic";
import Utils from '../common/Utils';
import inspector from '@ohos.arkui.inspector';


export default function buttonOnClickEventTest() {


  describe('ButtonOnHoverTest', () => {


    beforeEach(async (): Promise<void> => {
      try {
        await Utils.pushPage('button/ButtonOnHoverEventTest');
        await Utils.sleep(1000);
      } catch (err) {
        console.info('ButtonOnHoverTest beforeEach err: ' + JSON.stringify(err));
      }
    });


    /**
     * @tc.number   testButtonOnHover001
     * @tc.name     testButtonOnHover001
     * @tc.desc     testButtonOnHover001
     * @tc.level    Level.LEVEL1
     */
    it('testButtonOnHover001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let strJson = inspector.getInspectorByKey('OnHoverTestButton');
        let obj = JSON.parseJsonElement(strJson);
        let id = obj.getElement('$attrs').getString('id');
        expect(id).assertEqual('OnHoverTestButton');
        done()
      } catch (err) {
        console.info('testButtonOnHover001 err: ' + JSON.stringify(err));
        done();
      }
    })


  })
}
