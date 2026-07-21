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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webErrorPageTest() {

  describe('webErrorPageTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebErrorPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebErrorPage state success ' + JSON.stringify(pages));
        if (!('WebErrorPage' == pages.name)) {
          console.info('get WebErrorPage state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebErrorPage page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebErrorPage page error: ' + err);
      }
      let driver = Driver.create();
      await driver.waitForComponent(ON.id('WebErrorPageButton'),10000);
      console.log('waitForComponent WebErrorPageButton==>');
      done()
    });

    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebErrorPage beforeEach start');
      done();
    })

    afterEach(async (done: Function) => {
      console.info('WebErrorPage afterEach start');
      done();
    })

    /**
     * @tc.name   testSetErrorPageEnabledAndGetErrorPageEnabled01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0001
     * @tc.desc   test setErrorPageEnabled true getErrorPageEnabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledAndGetErrorPageEnabled01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled01', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledAndGetErrorPageEnabled01', true, 2025081401, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledAndGetErrorPageEnabled02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0002
     * @tc.desc   test setErrorPageEnabled false getErrorPageEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledAndGetErrorPageEnabled02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledAndGetErrorPageEnabled02', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledAndGetErrorPageEnabled02', false, 2025081402, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledErrorCode01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0003
     * @tc.desc   test setErrorPageEnabled null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode01', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledErrorCode01', 401, 2025081403, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledErrorCode02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0004
     * @tc.desc   test setErrorPageEnabled undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledErrorCode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode02', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledErrorCode02', 401, 2025081404, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledErrorCode03
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0005
     * @tc.desc   test setErrorPageEnabled init error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledErrorCode03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledErrorCode03', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledErrorCode03', 17100001, 2025081405, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testGetErrorPageEnabledErrorCode01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0006
     * @tc.desc   test setErrorPageEnabled init error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetErrorPageEnabledErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetErrorPageEnabledErrorCode01', 19);
      Utils.registerBaseEvent('testGetErrorPageEnabledErrorCode01', 17100001, 2025081406, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testOnOverrideErrorPage01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0007
     * @tc.desc   test onOverrideErrorPage invalid url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnOverrideErrorPage01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnOverrideErrorPage01', 19);
      let isReturn = 0;
      Utils.registerBaseEvent('testOnOverrideErrorPage01', 'ERR_INTERNET_DISCONNECTED', 26031034, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent('testOnOverrideErrorPage01', 'https://www.baiiiiiiiiidu.com/', 26031035, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent('testOnOverrideErrorPage01', true, 26031036, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent('testOnOverrideErrorPage01', true, 26031037, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent('testOnOverrideErrorPage01', false, 26031038, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent('testOnOverrideErrorPage01', false, 26031039, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent('testOnOverrideErrorPage01', 'GET', 26031040, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      Utils.registerBaseEvent('testOnOverrideErrorPage01', -106, 2025081407, ()=>{
        isReturn += 1;
      }, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
      if (await Utils.waitForExist(() => isReturn, 'testOnOverrideErrorPage01' + '_returnCheck', 8, 1000)) {
        done();
      }
    })
    /**
     * @tc.name   testOnOverrideErrorPage02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0008
     * @tc.desc   test onOverrideErrorPage http response empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnOverrideErrorPage02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnOverrideErrorPage02', 19);
      Utils.registerBaseEvent('testOnOverrideErrorPage02', 400, 2025081408, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledWithSubframe01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0009
     * @tc.desc   test setErrorPageEnabled(true, true) getErrorPageEnabled true getSubframeErrorPageEnabled true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledWithSubframe01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe01', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframe01', 'true,true', 2026072101, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledWithSubframe02
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0010
     * @tc.desc   test setErrorPageEnabled(true, false) getErrorPageEnabled true getSubframeErrorPageEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledWithSubframe02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe02', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframe02', 'true,false', 2026072102, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledWithSubframe03
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0011
     * @tc.desc   test setErrorPageEnabled(false, true); when enable is false, subframe error page stays disabled
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledWithSubframe03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe03', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframe03', 'false,false', 2026072103, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledWithSubframe04
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0012
     * @tc.desc   test setErrorPageEnabled(false, false) getErrorPageEnabled false getSubframeErrorPageEnabled false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledWithSubframe04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframe04', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframe04', 'false,false', 2026072104, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testSetErrorPageEnabledWithSubframeErrorCode01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0013
     * @tc.desc   test setErrorPageEnabled(enable, includeSubframe) init error 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetErrorPageEnabledWithSubframeErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitSetErrorPageEnabledWithSubframeErrorCode01', 19);
      Utils.registerBaseEvent('testSetErrorPageEnabledWithSubframeErrorCode01', 17100001, 2026072105, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })
    /**
     * @tc.name   testGetSubframeErrorPageEnabledErrorCode01
     * @tc.number SUB_ACE_WEB_ERRORPAGE_API_0014
     * @tc.desc   test getSubframeErrorPageEnabled init error 17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetSubframeErrorPageEnabledErrorCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitGetSubframeErrorPageEnabledErrorCode01', 19);
      Utils.registerBaseEvent('testGetSubframeErrorPageEnabledErrorCode01', 17100001, 2026072106, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('WebErrorPageButton', 10, '');
    })

  })
}
