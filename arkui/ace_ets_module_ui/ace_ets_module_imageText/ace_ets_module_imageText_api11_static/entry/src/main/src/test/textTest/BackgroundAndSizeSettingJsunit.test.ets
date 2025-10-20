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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError, RecordData } from '@ohos.base';
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function backgroundAndSizeSettingJsunit() {
  describe('backgroundAndSizeSettingTest', () => {

    beforeAll(() => {
      console.info("backgroundAndSizeSettingTest beforeEach start");


      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("backgroundAndSizeSettingTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/text/backgroundAndSizeSetting',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get backgroundAndSizeSettingTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get backgroundAndSizeSettingTest pages.name:" + '');
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push backgroundAndSizeSettingTest page error:" + err);
      }
      console.info("backgroundAndSizeSettingTest beforeEach end");
    });


    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("backgroundAndSizeSetting after each called");
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0100
     * @tc.name     testBackgroundAndSizeSetting_static_0100
     * @tc.desc     testBackgroundAndSizeSetting_static_0100
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0100', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testBackgroundAndSizeSetting_static_0100 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('fontColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testBackgroundAndSizeSetting_static_0100 component strJson:" + strJson);
      console.info("testBackgroundAndSizeSetting_static_0100 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");
      console.info('testBackgroundAndSizeSetting_static_0100 END');
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0200
     * @tc.name     testBackgroundAndSizeSetting_static_0200
     * @tc.desc     testBackgroundAndSizeSetting_static_0200
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0200', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testBackgroundAndSizeSetting_static_0200 START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "color": '0xFF0000'
          } as Record<String, RecordData>
        } as events_emitter.EventData
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 2,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("testBackgroundAndSizeSetting_static_0200 start pages");
        events_emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("testBackgroundAndSizeSetting_static_0200 change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('backgroundColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testBackgroundAndSizeSetting_static_0200 component strJson:" + strJson);
      console.info("testBackgroundAndSizeSetting_static_0200 rowDirection: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('direction'));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual("#FFEEEE00");
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0300
     * @tc.name     testBackgroundAndSizeSetting_static_0300
     * @tc.desc     testBackgroundAndSizeSetting_static_0300
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0300', Level.LEVEL1, async (done: ()=>void) => {
      console.info('testBackgroundAndSizeSetting_static_0300 START');
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('backgroundColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("testBackgroundAndSizeSetting_static_0300 component strJson:" + strJson);
      console.info("testBackgroundAndSizeSetting_static_0300 component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(obj.getElement('$attrs').getString('borderWidth')).assertEqual("1.00vp");
      console.info('testBackgroundAndSizeSetting_static_0300 END');
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0400
     * @tc.name     testBackgroundAndSizeSetting_static_0400
     * @tc.desc     testBackgroundAndSizeSetting_static_0400
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0400', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testBackgroundAndSizeSetting_static_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('centerRow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testBackgroundAndSizeSetting_static_0400] component strJson:" + strJson);
      expect(obj.getElement('$attrs').getString('width')).assertEqual('80.00vp');
      expect(obj.getElement('$attrs').getString('height')).assertEqual('80.00vp');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('margin')).assertEqual('20.00vp');
      console.info('[testBackgroundAndSizeSetting_static_0400] END');
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0500
     * @tc.name     testBackgroundAndSizeSetting_static_0500
     * @tc.desc     testBackgroundAndSizeSetting_static_0500
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0500', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testBackgroundAndSizeSetting_static_0500] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('innerRow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testBackgroundAndSizeSetting_static_0500] component strJson:" + strJson);
      expect(obj.getElement('$attrs').getString('width')).assertEqual('100.00%');
      expect(obj.getElement('$attrs').getString('height')).assertEqual('100.00%');
      console.info('[testBackgroundAndSizeSetting_static_0500] END');
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0600
     * @tc.name     testBackgroundAndSizeSetting_static_0600
     * @tc.desc     testBackgroundAndSizeSetting_static_0600
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0600', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testBackgroundAndSizeSetting_static_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '200',
            "height": '200',
            "padding": '10',
            "margin": '40'
          }as Record<String, RecordData>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 34,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBackgroundAndSizeSetting_static_0600] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testBackgroundAndSizeSetting_static_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('centerRow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testBackgroundAndSizeSetting_static_0600] component strJson:" + strJson);
      expect(obj.getElement('$attrs').getString('width')).assertEqual('200.00vp');
      expect(obj.getElement('$attrs').getString('height')).assertEqual('200.00vp');
      expect(obj.getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      expect(obj.getElement('$attrs').getString('margin')).assertEqual('40.00vp');
      console.info('[testBackgroundAndSizeSetting_static_0600] END');
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0700
     * @tc.name     testBackgroundAndSizeSetting_static_0700
     * @tc.desc     testBackgroundAndSizeSetting_static_0700
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0700', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testBackgroundAndSizeSetting_static_0700] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "width": '80%',
            "height": '80%'
          }as Record<String, RecordData>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 35,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBackgroundAndSizeSetting_static_0700] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testBackgroundAndSizeSetting_static_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(3000);
      let strJson: string = inspector.getInspectorByKey('innerRow');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testBackgroundAndSizeSetting_static_0700] component strJson:" + strJson);
      expect(obj.getElement('$attrs').getString('width')).assertEqual('80.00%');
      expect(obj.getElement('$attrs').getString('height')).assertEqual('80.00%');
      console.info('[testBackgroundAndSizeSetting_static_0700] END');
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0800
     * @tc.name     testBackgroundAndSizeSetting_static_0800
     * @tc.desc     testBackgroundAndSizeSetting_static_0800
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0800', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testBackgroundAndSizeSetting_static_0800] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('layoutWeight1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testBackgroundAndSizeSetting_static_0800] component strJson:" + strJson);
      expect(obj.getElement('$attrs').getInteger('layoutWeight')).assertEqual(1);
      console.info('[testBackgroundAndSizeSetting_static_0800] END');
      done();
    });

    /*
     * @tc.number   testBackgroundAndSizeSetting_static_0900
     * @tc.name     testBackgroundAndSizeSetting_static_0900
     * @tc.desc     testBackgroundAndSizeSetting_static_0900
     * @tc.level    Level.LEVEL1
     */
it('testBackgroundAndSizeSetting_static_0900', Level.LEVEL1, async (done: ()=>void) => {
      console.info('[testBackgroundAndSizeSetting_static_0900] START');
      await CommonFunc.sleep(1000);
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "weight": '3'
          }as Record<String, RecordData>
        } as events_emitter.EventData
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 36,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testBackgroundAndSizeSetting_static_0900] start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("[testBackgroundAndSizeSetting_static_0900] change component data error: " + err.message);
      }
      await CommonFunc.sleep(2000);
      let strJson: string = inspector.getInspectorByKey('layoutWeight1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[testBackgroundAndSizeSetting_static_0900] component strJson:" + strJson);
      expect(obj.getElement('$attrs').getString('layoutWeight')).assertEqual(3);
      console.info('[testBackgroundAndSizeSetting_static_0900] END');
      done();
    });
  })
}
