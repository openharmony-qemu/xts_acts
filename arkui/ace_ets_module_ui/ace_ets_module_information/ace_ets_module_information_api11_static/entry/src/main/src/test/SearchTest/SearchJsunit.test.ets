/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { CopyOptions } from '@ohos.arkui.component'
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import events_emitter from '@ohos.events.emitter';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.information/MainAbility';

export default function searchJsunit() {
  describe('searchJsunit', () => {
    beforeAll(() => {
      console.info("searchJsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    
    beforeEach(async () => {
      // config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
      //   console.info(`enable success`);
      // }).catch((err: object) => {
      //   console.error(`failed to enable, ${err}`);
      // })
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Search/search',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get search state success " + JSON.stringify(pages));
        if (!("search" == pages.name)) {
          console.info("get search success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push search page error " + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000);
      console.info("search after each called");
    });

    it('testSearch_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch001] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch001] component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('searchButton')).assertEqual('10');
      done();
    });

    it('testSearch_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch002] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "searchButton": "5"
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch002] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch002] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJsonNew = inspector.getInspectorByKey('search');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("[testSearch002] component objNew is: " + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getString('searchButton')).assertEqual('5');
      done();
    });

    /*
     * @tc.number :testSearch003
     * @tc.name   :test maxLength interface
     * @tc.desc   :set max length 19, get backend max length property
     */
    it('testSearch_static_003', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch003] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch003] component strJson:" + strJson);
      let obj3 = JSON.parseJsonElement(strJson);
      expect(obj3.getElement('$attrs').getString('maxLength')).assertEqual('19');
      done();
    });

    /*
     * @tc.number :testSearch004
     * @tc.name   :test maxLength interface
     * @tc.desc   :set max length 0, get backend max length property
     */
    it('testSearch_static_004', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch004] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 0
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch004] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch004] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch004] component strJson:" + strJson);
      let obj4 = JSON.parseJsonElement(strJson);
      expect(obj4.getElement('$attrs').getString('maxLength')).assertEqual('0');
      done();
    });

    /*
     * @tc.number :testSearch005
     * @tc.name   :test maxLength interface
     * @tc.desc   :set max length 0, get backend max length property
     */
    it('testSearch_static_005', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch005] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 123
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch005] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch005] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch005] component strJson:" + strJson);
      let obj5 = JSON.parseJsonElement(strJson);
      expect(obj5.getElement('$attrs').getString('maxLength')).assertEqual('123');
      done();
    });

    /*
     * @tc.number :testSearch006
     * @tc.name   :test maxLength interface
     * @tc.desc   :set max length 1000000, get backend max length property
     */
    it('testSearch_static_006', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch006] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 1000000
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch006] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch006] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch006] component strJson:" + strJson);
      let obj6 = JSON.parseJsonElement(strJson);
      expect(obj6.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      done();
    });

    /*
     * @tc.number :testSearch007
     * @tc.name   :test maxLength interface
     * @tc.desc   :set max length illeggal value, get backend max length property
     */
    it('testSearch_static_007', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch007] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": -1
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch007] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch007] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch007] component strJson:" + strJson);
      let obj7 = JSON.parseJsonElement(strJson);
      expect(obj7.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      done();
    });

    /*
     * @tc.number :testSearch008
     * @tc.name   :test maxLength interface
     * @tc.desc   :set max length illeggal value, get backend max length property
     */
    it('testSearch_static_008', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch008] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "maxLength": 1020300
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch008] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch008] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch008] component strJson:" + strJson);
      let obj8 = JSON.parseJsonElement(strJson);
      expect(obj8.getElement('$attrs').getString('maxLength')).assertEqual('INF');
      done();
    });

    /*
     * @tc.number :testSearch009
     * @tc.name   :test copy options
     * @tc.desc   :get default copy options
     */
    it('testSearch_static_009', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch009] START');
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch009] component strJson:" + strJson);
      let obj9 = JSON.parseJsonElement(strJson);
      expect(obj9.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.Local');
      done();
    });

    /*
     * @tc.number :testSearch0010
     * @tc.name   :test copy options
     * @tc.desc   :get default copy options
     */
    it('testSearch_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch0010] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "copyOption": CopyOptions.InApp
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch0010] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch0010] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch0010] component strJson:" + strJson);
      let obj10 = JSON.parseJsonElement(strJson);
      expect(obj10.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.InApp');
      done();
    });

    /*
     * @tc.number :testSearch0011
     * @tc.name   :test copy options
     * @tc.desc   :get CopyOptions.CROSS_DEVICE
     */
    it('testSearch_static_0011', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch0011] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            // "copyOption": CopyOptions.CROSS_DEVICE
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch0011] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch0011] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('search');
      console.info("[testSearch0011] component strJson:" + strJson);
      let obj11 = JSON.parseJsonElement(strJson);
      expect(obj11.getElement('$attrs').getString('copyOption')).assertEqual('CopyOptions.Distributed');
      done();
    });

    /*
     * @tc.number :testSearch099
     * @tc.name   :test  getCaretOffset when null input
     * @tc.desc   :expect caretOffset index 0 when text is null
     */
    it('testSearch_static_099', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch099] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn'));
      btn?.click();
      await CommonFunc.sleep(2000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText'));
      let text = caretText?.getText();
      expect(text).assertEqual('Index0');
      done();
    });

    /*
     * @tc.number :testSearch100
     * @tc.name   :test getCaretOffset
     * @tc.desc   :expect caretOffset index 9 when text length is 9
     */
    it('testSearch_static_100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch100] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text": '123456789'
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch100] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch100] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn'));
      btn?.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText'));
      let text = caretText?.getText();
      expect(text).assertEqual('Index9');
      done();
    });

    /*
     * @tc.number :testSearch101
     * @tc.name   :test getCaretOffset when iput text exceed maxLength
     * @tc.desc   :expect caretOffset index max length.
     */
    it('testSearch_static_101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testSearch101] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "text": '1234567890abc'
          } as Record<String,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 190,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testSearch101] start to publish emit");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testSearch101] change component data error: " + (err as BusinessError).message);
      }
      await CommonFunc.sleep(2000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id('caretOffsetBtn'));
      btn?.click();
      await CommonFunc.sleep(1000);
      let caretText = await driver.findComponent(ON.id('caretOffsetText'));
      let text = caretText?.getText();
      expect(text).assertEqual('Index10');
      done();
    });
  })
}
