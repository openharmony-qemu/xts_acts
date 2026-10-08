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
import { waitForComponent,waitAndClickComponent } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const driver = Driver.create();
// @ts-nocheck
let emitKey = "emitSupportCssDisplayChange0100"

export default function webViewSupportCssDisplayChange() {
  describe('ActsAcewSupportCssDisplayChange', () => {
      
    beforeAll(async (done: Function) => {
        let options : router.RouterOptions = {
            url: 'testability/pages/WebViewSupportCssDisplayChange',
        }
        
        try {
            router.clear();
            let pages = router.getState();
            console.info("get webViewSupportCssDisplayChange state success " + JSON.stringify(pages));
            if (!("SupportCssDisplayChange" == pages.name)) {
                console.info("get webViewSupportCssDisplayChange state success " + JSON.stringify(pages.name));
                let result = await router.pushUrl(options);
                console.info("push emitSupportCssDisplayChange0100 page success " + JSON.stringify(result));
            }
        } catch (err) {
            console.error("push webViewSupportCssDisplayChange page error:" + err);
        }
        await waitForComponent("WebSupportCssDisplayChangeButton");
        done()
    });
    
    beforeEach(async (done: Function) => {
      done();
    })

    afterEach(async (done: Function) => {
        console.info("emit emitKey error:" );
      done();
    })

    /**
     * @tc.name   emitSupportCssDisplayChange0100
     * @tc.number SUB_ACE_WEB_SUPPORTCSSDISPLAYCHANGE_API_0100
     * @tc.desc   emitSupportCssDisplayChange0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSupportCssDisplayChange0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSupportCssDisplayChange0100", 153940)
      Utils.registerEvent("emitSupportCssDisplayChange0100", 'Hidden', 153950, done);
      await waitAndClickComponent("WebSupportCssDisplayChangeButton",driver);
    })

    /**
     * @tc.name   emitSupportCssDisplayChange0200
     * @tc.number SUB_ACE_WEB_SUPPORTCSSDISPLAYCHANGE_API_0200
     * @tc.desc   emitSupportCssDisplayChange0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSupportCssDisplayChange0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSupportCssDisplayChange0200", 153940)
      Utils.registerEvent("emitSupportCssDisplayChange0200", 'visible', 153960, done);
      await waitAndClickComponent("WebSupportCssDisplayChangeButton",driver);
    })

    /**
     * @tc.name   emitSupportCssDisplayChange0300
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_SUPPORTCSSDISPLAYCHANGE_0300
     * @tc.desc   nativeEmbedOptions supportCssDisplayChange false
     */
    it('emitSupportCssDisplayChange0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSupportCssDisplayChange0300", 153940)
      Utils.registerEvent("emitSupportCssDisplayChange0300", 'success', 153970, done);
      await waitAndClickComponent("WebSupportCssDisplayChangeButton",driver);
    })

    /**
     * @tc.name   emitSupportTransformRotateAndSkew0100
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_SUPPORTTRANSFORMROTATEANDSKEW_0100
     * @tc.desc   nativeEmbedOptions supportTransformRotateAndSkew true
     */
    it('emitSupportTransformRotateAndSkew0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSupportTransformRotateAndSkew0100", 153940)
      Utils.registerEvent("emitSupportTransformRotateAndSkew0100", 'success', 153971, done);
      await waitAndClickComponent("WebSupportCssDisplayChangeButton",driver);
    })

    /**
     * @tc.name   emitSupportTransformRotateAndSkew0200
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_SUPPORTTRANSFORMROTATEANDSKEW_0200
     * @tc.desc   nativeEmbedOptions supportTransformRotateAndSkew false
     */
    it('emitSupportTransformRotateAndSkew0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitSupportTransformRotateAndSkew0200", 153940)
      Utils.registerEvent("emitSupportTransformRotateAndSkew0200", 'success', 153972, done);
      await waitAndClickComponent("WebSupportCssDisplayChangeButton",driver);
    })

    /**
     * @tc.name   emitNativeEmbedOptionsNull0100
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_NULL_0100
     * @tc.desc   nativeEmbedOptions null
     */
    it('emitNativeEmbedOptionsNull0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitNativeEmbedOptionsNull0100", 153940)
      Utils.registerEvent("emitNativeEmbedOptionsNull0100", 'success', 153980, done);
      await waitAndClickComponent("WebSupportCssDisplayChangeButton",driver);
    })

    /**
     * @tc.name   emitNativeEmbedOptionsUndefined0100
     * @tc.number SUB_WEB_NATIVEEMBEDOPTIONS_UNDEFINED_0100
     * @tc.desc   nativeEmbedOptions undefined
     */
    it('emitNativeEmbedOptionsUndefined0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitNativeEmbedOptionsUndefined0100", 153940)
      Utils.registerEvent("emitNativeEmbedOptionsUndefined0100", 'success', 153990, done);
      await waitAndClickComponent("WebSupportCssDisplayChangeButton",driver);
    })

    /**
     * @tc.name   emitSupportDefaultIntrinsicSize0100
     * @tc.number emitSupportDefaultIntrinsicSize0100
     * @tc.desc   nativeEmbedOptions supportDefaultIntrinsicSize true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSupportDefaultIntrinsicSize0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitSupportDefaultIntrinsicSize0100', 153940)
        Utils.registerEvent('emitSupportDefaultIntrinsicSize0100', 'success', 154010, done);
        await waitAndClickComponent('WebSupportCssDisplayChangeButton', driver);
      })

    /**
     * @tc.name   emitSupportDefaultIntrinsicSize0200
     * @tc.number emitSupportDefaultIntrinsicSize0200
     * @tc.desc   nativeEmbedOptions supportDefaultIntrinsicSize false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitSupportDefaultIntrinsicSize0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        Utils.emitEvent('emitSupportDefaultIntrinsicSize0200', 153940)
        Utils.registerEvent('emitSupportDefaultIntrinsicSize0200', 'success', 154011, done);
        await waitAndClickComponent('WebSupportCssDisplayChangeButton', driver);
      })

  })
}
