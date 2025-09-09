/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
// @ts-nocheck
let emitKey = ""

export default function WebViewRegisterNativeEmbedRule() {
  describe('WebViewRegisterNativeEmbedRule', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewRegisterNativeEmbedRule',
      }

      try {
        await Utils.sleep(1000)
        router.clear();
        let pages = router.getState();
        console.info("get WebViewRegisterNativeEmbedRule state success " + JSON.stringify(pages));
        if (!("WebViewRegisterNativeEmbedRule" == pages.name)) {
          console.info("get WebViewRegisterNativeEmbedRule state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(1000);
          console.info("push WebViewRegisterNativeEmbedRule state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewRegisterNativeEmbedRule page error:" + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    })


    /*
        * @tc.number     : SUB_WEB_EMBEDVISIBILITYCHANGE_0100
        * @tc.name       : emitEmbedVisibilityChange001
        * @tc.desc       : test EmbedVisibilityChange
        * @tc.size       : MediumTest
        * @tc.type       : Function
        * @tc.level      : Level 1
        */
    it('emitWebViewRegisterNativeEmbedRule0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebViewRegisterNativeEmbedRule0100"
      Utils.emitEvent(emitKey, 10);
      Utils.registerEvent("emitWebViewRegisterNativeEmbedRule0100", true, 20250909, done);
      sendEventByKey('webViewRegisterNativeEmbedRule', 10, '');
    })

  })
}
