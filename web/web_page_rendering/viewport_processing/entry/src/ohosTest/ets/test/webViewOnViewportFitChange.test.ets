/**
 * Copyright (c) 2023 iSoftStone Information Technology (Group) Co.,Ltd.
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
import { Driver } from '@ohos.UiTest';
const driver = Driver.create();
export default function webViewOnViewportFitChange() {
  describe('ActsAceWebViewOnViewportFitChange', () => {
   beforeEach(async (done: Function) => {
     await waitForComponent("webViewOnViewportFitChange");
     done();
    })

    /**
     * @tc.name   testWebViewOnViewportFitChange
     * @tc.number SUB_ACE_WEB_OnViewportFitChange_API_0001
     * @tc.desc   test OnViewportFitChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebViewOnViewportFitChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.emitEvent("emitWebViewOnViewportFitChange", 154030);
        Utils.registerEvent("testWebViewOnViewportFitChange", true, 154040, done);
        waitAndClickComponent("webViewOnViewportFitChange",driver);

    })

    /**
     * @tc.name   testWebView_ViewportFit_COVER
     * @tc.number SUB_ACE_WEB_ViewportFit_COVER_API_0002
     * @tc.desc   ViewportFit_COVER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_ViewportFit_COVER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        Utils.emitEvent("emitWebView_ViewportFit_COVER", 154030);
        Utils.registerEvent("testWebView_ViewportFit_COVER", true, 154050, done);
      waitAndClickComponent("webViewOnViewportFitChange",driver);
    })
  })
}
