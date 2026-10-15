/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, expect, describe, it, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function webResourceResponseSetResponseBodyParam() {

  describe('webResourceResponseSetResponseBodyParamTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webResourceResponseSetResponseBodyParam',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webResourceResponseSetResponseBodyParam state success ' + JSON.stringify(pages));
        if (!('webResourceResponseSetResponseBodyParam' == pages.name)) {
          console.info('get webResourceResponseSetResponseBodyParam state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webResourceResponseSetResponseBodyParam page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webResourceResponseSetResponseBodyParam page error: ' + err);
      }
      console.log('driver waitForComponent start==>');
      await driver.waitForComponent(ON.id('webResourceResponseSetResponseBodyParamButton'), 10000);
      console.log('waitForComponent webResourceResponseSetResponseBodyParamButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webResourceResponseSetResponseBodyParam beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('webResourceResponseSetResponseBodyParam afterEach start');
      done();
    })

    /**
     * @tc.name   testSetResponseBodyNull001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NULL_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyNull001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyNull001', 'success', 174710, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyUndefined001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_UNDEFINED_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyUndefined001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyUndefined001', 'success', 174720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyEmptyString001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_EMPTYSTRING_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyEmptyString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyEmptyString001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyEmptyString001', 'success', 174730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyHtmlString001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_HTMLSTRING_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with HTML string parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyHtmlString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyHtmlString001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyHtmlString001', 'success', 174735, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyNumber001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NUMBER_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNumber001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyNumber001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyNumber001', 'success', 174740, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyNumberZero001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NUMBERZERO_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with number zero parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNumberZero001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyNumberZero001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyNumberZero001', 'success', 174750, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyNumberNegative001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_NUMBERNEGATIVE_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with negative number parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyNumberNegative001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyNumberNegative001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyNumberNegative001', 'success', 174760, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyResource001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_RESOURCE_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with Resource parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyResource001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyResource001', 'success', 174770, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })

    /**
     * @tc.name   testSetResponseBodyArrayBuffer001
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_SETRESPONSEBODY_ARRAYBUFFER_0100
     * @tc.desc   test WebResourceResponse.setResponseBody with ArrayBuffer parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetResponseBodyArrayBuffer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitSetResponseBodyArrayBuffer001', 174700);
      Utils.registerBaseEvent('testSetResponseBodyArrayBuffer001', 'success', 174780, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('webResourceResponseSetResponseBodyParamButton', 10, '');
    })
  })
}
