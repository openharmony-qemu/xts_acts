/*
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
import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import webview from '@ohos.web.webview';
import Utils from './Utils.test';
import { Driver, ON } from '@ohos.UiTest';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';

const EVENT_ID_SET_EMIT_KEY = 251107;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebResourceTypeTest() {

  describe('WebResourceType', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebResourceType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebResourceType state success " + JSON.stringify(pages));
        if (!("WebResourceType" == pages.name)) {
          console.info("get WebResourceType state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebResourceType page success");
        }
      } catch (err) {
        console.error("push WebResourceType page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebResourceTypeButton"), 10000);
      console.log("waitForComponent WebResourceTypeButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_MAIN_FRAME
    * @tc.name       : WebResourceType_MAIN_FRAME
    * @tc.desc       : test WebResourceType_MAIN_FRAME
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('WebResourceType_MAIN_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("WebResourceType_MAIN_FRAME", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_MAIN_FRAME", 0, 25110700, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.MAIN_FRAME);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_STYLE_SHEET
    * @tc.name       : WebResourceType_STYLE_SHEET
    * @tc.desc       : test WebResourceType_STYLE_SHEET
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_STYLE_SHEET', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_STYLE_SHEET", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_STYLE_SHEET", 0, 25110702, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.STYLE_SHEET);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_SCRIPT
    * @tc.name       : WebResourceType_SCRIPT
    * @tc.desc       : test WebResourceType_SCRIPT
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_SCRIPT', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_SCRIPT", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_SCRIPT", 0, 25110703, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.SCRIPT);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_IMAGE
    * @tc.name       : WebResourceType_IMAGE
    * @tc.desc       : test WebResourceType_IMAGE
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_IMAGE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_IMAGE", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_IMAGE", 0, 25110704, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.IMAGE);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_FONT_RESOURCE
    * @tc.name       : WebResourceType_FONT_RESOURCE
    * @tc.desc       : test WebResourceType_FONT_RESOURCE
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_FONT_RESOURCE', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_FONT_RESOURCE", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_FONT_RESOURCE", 0, 25110705, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.FONT_RESOURCE);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_FAVICON
    * @tc.name       : WebResourceType_FAVICON
    * @tc.desc       : test WebResourceType_FAVICON
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_FAVICON', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_FAVICON", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_FAVICON", 0, 25110712, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.FAVICON);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_XHR
    * @tc.name       : WebResourceType_XHR
    * @tc.desc       : test WebResourceType_XHR
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_XHR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_XHR", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_XHR", 0, 25110713, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.XHR);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_PING
    * @tc.name       : WebResourceType_PING
    * @tc.desc       : test WebResourceType_PING
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_PING', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_PING", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_PING", 0, 25110714, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.PING);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_SERVICE_WORKER
    * @tc.name       : WebResourceType_SERVICE_WORKER
    * @tc.desc       : test WebResourceType_SERVICE_WORKER
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_SERVICE_WORKER', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_SERVICE_WORKER", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_SERVICE_WORKER", 0, 25110715, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.SERVICE_WORKER);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_SUB_FRAME
    * @tc.name       : WebResourceType_SUB_FRAME
    * @tc.desc       : test WebResourceType_SUB_FRAME
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_SUB_FRAME', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_SUB_FRAME", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_SUB_FRAME", 0, 25110701, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.SUB_FRAME);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_MEDIA
    * @tc.name       : WebResourceType_MEDIA
    * @tc.desc       : test WebResourceType_MEDIA
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('WebResourceType_MEDIA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("WebResourceType_MEDIA", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("WebResourceType_MEDIA", 0, 25110700, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.MEDIA);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

  })
}
