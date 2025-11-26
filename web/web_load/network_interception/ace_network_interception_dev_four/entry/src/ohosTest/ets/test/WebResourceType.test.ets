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
    * @tc.name       : testWebResourceTypeMainFrame
    * @tc.desc       : test WebResourceTypeMainFrame
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testWebResourceTypeMainFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeMainFrame", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeMainFrame", 0, 25110700, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.MAIN_FRAME);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_STYLE_SHEET
    * @tc.name       : testWebResourceTypeStyleSheet
    * @tc.desc       : test WebResourceTypeStyleSheet
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeStyleSheet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeStyleSheet", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeStyleSheet", 0, 25110702, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.STYLE_SHEET);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_SCRIPT
    * @tc.name       : testWebResourceTypeScript
    * @tc.desc       : test WebResourceTypeScript
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeScript', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeScript", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeScript", 0, 25110703, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.SCRIPT);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_IMAGE
    * @tc.name       : testWebResourceTypeImage
    * @tc.desc       : test WebResourceTypeImage
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeImage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeImage", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeImage", 0, 25110704, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.IMAGE);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_FONT_RESOURCE
    * @tc.name       : testWebResourceTypeFontResource
    * @tc.desc       : test WebResourceTypeFontResource
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeFontResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeFontResource", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeFontResource", 0, 25110705, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.FONT_RESOURCE);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_FAVICON
    * @tc.name       : testWebResourceFavicon
    * @tc.desc       : test tWebResourceFavicon
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceFavicon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceFavicon", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceFavicon", 0, 25110712, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.FAVICON);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_XHR
    * @tc.name       : testWebResourceTypeXhr
    * @tc.desc       : test WebResourceTypeXhr
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeXhr', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeXhr", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeXhr", 0, 25110713, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.XHR);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_SERVICE_WORKER
    * @tc.name       : testWebResourceTypeServiceWorker
    * @tc.desc       : test WebResourceTypeServiceWorker
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeServiceWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeServiceWorker", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeServiceWorker", 0, 25110715, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.SERVICE_WORKER);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_SUB_FRAME
    * @tc.name       : testWebResourceTypeSubFrame
    * @tc.desc       : test WebResourceTypeSubFrame
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeSubFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeSubFrame", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeSubFrame", 0, 25110701, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.SUB_FRAME);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_OBJECT
    *@tc.name    : testWebResourceTypeObject
    *@tc.desc    : test WebResourceType OBJECT
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypeObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
     Utils.emitEvent("testWebResourceTypeObject", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeObject", 0, 25110707, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.OBJECT);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })


    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_MEDIA
    * @tc.name       : testWebResourceTypeMedia
    * @tc.desc       : test WebResourceTypeMedia
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypeMedia', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypeMedia", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypeMedia", 0, 25110708, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.MEDIA);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_PING
    * @tc.name       : testWebResourceTypePing
    * @tc.desc       : test WebResourceTypePing
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypePing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypePing", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypePing", 0, 25110714, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.PING);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEBVIEW_WebResourceType_PREFETCH
    * @tc.name       : testWebResourceTypePrefetch
    * @tc.desc       : test WebResourceType PREFETCH
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testWebResourceTypePrefetch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testWebResourceTypePrefetch", EVENT_ID_SET_EMIT_KEY);
      Utils.registerBaseEvent("testWebResourceTypePrefetch", 0, 25110711, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(webview.WebResourceType.PREFETCH);
      });
      sendEventByKey('WebResourceTypeButton', 10, '');
    })


   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_SUB_RESOURCE
    *@tc.name    : testWebResourceTypeSubResource
    *@tc.desc    : test WebResourceType SUB_RESOURCE
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypeSubResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebResourceTypeSubResource start')
        try {
            expect(webview.WebResourceType.SUB_RESOURCE).assertEqual(6)
        } catch(error) {
            console.error('testWebResourceTypeSubResource error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebResourceTypeSubResource end')
        done()
    })



   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_WORKER
    *@tc.name    : testWebResourceTypeWorker
    *@tc.desc    : test WebResourceType WORKER
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypeWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebResourceTypeWorker start')
        try {
            expect(webview.WebResourceType.WORKER).assertEqual(9)
        } catch(error) {
            console.error('testWebResourceTypeWorker error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebResourceTypeWorker end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_SHARED_WORKER
    *@tc.name    : testWebResourceTypeSharedWorker
    *@tc.desc    : test WebResourceType SHARED_WORKER
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypeSharedWorker', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebResourceTypeSharedWorker start')
        try {
            expect(webview.WebResourceType.SHARED_WORKER).assertEqual(10)
        } catch(error) {
            console.error('testWebResourceTypeSharedWorker error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebResourceTypeSharedWorker end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_CSP_REPORT
    *@tc.name    : testWebResourceTypeCspReport
    *@tc.desc    : test WebResourceType CSP_REPORT
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypeCspReport', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebResourceTypeCspReport start')
        try {
            expect(webview.WebResourceType.CSP_REPORT).assertEqual(16)
        } catch(error) {
            console.error('testWebResourceTypeCspReport error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebResourceTypeCspReport end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_PLUGIN_RESOURCE
    *@tc.name    : testWebResourceTypePluginResource
    *@tc.desc    : test WebResourceType PLUGIN_RESOURCE
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypePluginResource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebResourceTypePluginResource start')
        try {
            expect(webview.WebResourceType.PLUGIN_RESOURCE).assertEqual(17)
        } catch(error) {
            console.error('testWebResourceTypePluginResource error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebResourceTypePluginResource end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_NAVIGATION_PRELOAD_MAIN_FRAME
    *@tc.name    : testWebResourceTypeNavigationPreloadMainFrame
    *@tc.desc    : test WebResourceType NAVIGATION_PRELOAD_MAIN_FRAME
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypeNavigationPreloadMainFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebResourceTypeNavigationPreloadMainFrame start')
        try {
            expect(webview.WebResourceType.NAVIGATION_PRELOAD_MAIN_FRAME).assertEqual(19)
        } catch(error) {
            console.error('testWebResourceTypeNavigationPreloadMainFrame error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebResourceTypeNavigationPreloadMainFrame end')
        done()
    })

   /*
    *@tc.number  : SUB_WEBVIEW_WebResourceType_NAVIGATION_PRELOAD_SUB_FRAME
    *@tc.name    : testWebResourceTypeNavigationPreloadSubFrame
    *@tc.desc    : test WebResourceType NAVIGATION_PRELOAD_SUB_FRAME
    *@tc.size    : MediumTest
    *@tc.type    : Function
    *@tc.level   : Level 2
    */
    it('testWebResourceTypeNavigationPreloadSubFrame', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        console.log('testWebResourceTypeNavigationPreloadSubFrame start')
        try {
            expect(webview.WebResourceType.NAVIGATION_PRELOAD_SUB_FRAME).assertEqual(20)
        } catch(error) {
            console.error('testWebResourceTypeNavigationPreloadSubFrame error: ' + JSON.stringify(error))
            expect(0).assertEqual(1)
        }
        console.log('testWebResourceTypeNavigationPreloadSubFrame end')
        done()
    })

  })
}
