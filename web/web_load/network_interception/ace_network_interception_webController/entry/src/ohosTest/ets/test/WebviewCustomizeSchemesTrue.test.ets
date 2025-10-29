/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();


export default function webviewCustomizeSchemesTrueTest() {

  describe('webviewCustomizeSchemesTrueTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webviewCustomizeSchemesTrue',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webviewCustomizeSchemesTrue state success ' + JSON.stringify(pages));
        if (!("webviewCustomizeSchemesTrue" == pages.name)) {
          console.info('get webviewCustomizeSchemesTrue state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webviewCustomizeSchemesTrue page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webviewCustomizeSchemesTrue page error: ' + err);
      }
      await driver.waitForComponent(ON.id('CustomizeSchemesTrueButton'),10000);
      console.log('CustomizeSchemesTrueButton click==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webviewCustomizeSchemesTrue beforeEach start');
      done();
    })


    /**
    * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0100
    * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue01
    * @tc.desc   test lazyInitWebEngine true fetch request in customizeSchemes
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 0
    */
    it('testCustomizeSchemesLazyInitWebEngineTrue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue01', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue01', true, 2025102801,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0200
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue02
     * @tc.desc   test lazyInitWebEngine true fetch request not in customizeSchemes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue02', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue02', true, 2025102802,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0300
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue03
     * @tc.desc   test lazyInitWebEngine true isSupportCORS true isSupportFetch false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrue03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue03', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue03', true, 2025102803,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_TRUE_0400
     * @tc.name   testCustomizeSchemesLazyInitWebEngineTrue04
     * @tc.desc   test lazyInitWebEngine true isSupportCORS false isSupportFetch false
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('testCustomizeSchemesLazyInitWebEngineTrue04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineTrue04', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineTrue04', true, 2025102804,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_ERROR_0100
     * @tc.name   testCustomizeSchemesLazyInitWebEngineError01
     * @tc.desc   test lazyInitWebEngine true schemeName length exceeds 32
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('testCustomizeSchemesLazyInitWebEngineError01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineError01', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineError01', 401, 2025102805,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_ERROR_0200
     * @tc.name   testCustomizeSchemesLazyInitWebEngineError02
     * @tc.desc   test lazyInitWebEngine true customizeSchemes length exceeds 10
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('testCustomizeSchemesLazyInitWebEngineError02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineError02', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineError02', 401, 2025102806,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })
    /**
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_CUSTOMIZESCHEMES_LAZYINITWEBENGINE_ERROR_0300
     * @tc.name   testCustomizeSchemesLazyInitWebEngineError03
     * @tc.desc   test lazyInitWebEngine true customizeSchemes 17100020
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('testCustomizeSchemesLazyInitWebEngineError03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitCustomizeSchemesLazyInitWebEngineError03', 123)
      Utils.registerBaseEvent('testCustomizeSchemesLazyInitWebEngineError03', 17100020, 2025102807,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('CustomizeSchemesTrueButton', 10, '');
    })


  })
}
