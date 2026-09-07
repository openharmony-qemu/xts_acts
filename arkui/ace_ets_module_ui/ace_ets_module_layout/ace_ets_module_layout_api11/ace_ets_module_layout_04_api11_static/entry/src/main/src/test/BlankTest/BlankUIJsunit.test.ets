'use static';
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { ResourceColor } from '@ohos.arkui.component'

import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function blankUIJsunit() {
  describe('blankUIJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("blankJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Blank/blankParentWidth',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get blankJsunit state pages:" + "");
        if (!("blankParentWidth" == pages.name)) {
          console.info("get blankJsunit state pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000)
        }
      } catch (err) {
          console.error("push blankJsunit page error:" + err);
	        expect().assertFail();
      }
    });


/**
     * @tc.number   blankJsunit_static_0100
     * @tc.name     blankJsunit_static_0100
     * @tc.desc     blankJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0100 START');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<ResourceColor>("blankColor",'#FCAE5394')
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('bl2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0100'] component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#FCAE5394');
      done();
    });

/**
     * @tc.number   blankJsunit_static_0200
     * @tc.name     blankJsunit_static_0200
     * @tc.desc     blankJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0200 START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<number | string>("minWith",'80')
      try {
      await CommonFunc.sleep(3000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      
      let strJson = inspector.getInspectorByKey('bl2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0200'] component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('min')).assertEqual('80.00vp');
      done();
    });

/**
     * @tc.number   blankJsunit_static_0300
     * @tc.name     blankJsunit_static_0300
     * @tc.desc     blankJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0300 START');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<number | string>("minWith",'-30')
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('bl2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0300'] component obj is: " + obj.getElement('$attrs').getString('min'));
     
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

/**
     * @tc.number   blankJsunit_static_0400
     * @tc.name     blankJsunit_static_0400
     * @tc.desc     blankJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0400 START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<ResourceColor>("blankColor",'#AE53')
      try {
      await CommonFunc.sleep(3000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
       
      let strJson = inspector.getInspectorByKey('bl2');
      console.info("[blankJsunit_static_0400'] component obj is: " + strJson);
     let obj = JSON.parseJsonElement(strJson);
     
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#AAEE5533');
      done();
    });

/**
     * @tc.number   blankJsunit_static_0500
     * @tc.name     blankJsunit_static_0500
     * @tc.desc     blankJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0500 START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
       
      let text1_rect = CommonFunc.getComponentRect('text1');
      let toggle1_rect = CommonFunc.getComponentRect('toggle1');
      let bl1_rect = CommonFunc.getComponentRect('bl1');
      console.info("[blankJsunit_static_0500'] text1_rect is " + JSON.stringify(text1_rect) + "toggle1_rect is " + JSON.stringify(toggle1_rect) + "bl1.rect is " + JSON.stringify(bl1_rect));
      
      expect(bl1_rect.left - bl1_rect.right).assertEqual(0)
      let strJson = inspector.getInspectorByKey('blankUIJsunit_blank');
     let obj = JSON.parseJsonElement(strJson);
       console.info("[blankJsunit_static_0500'] component obj is: " + strJson);
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

/**
     * @tc.number   blankJsunit_static_0600
     * @tc.name     blankJsunit_static_0600
     * @tc.desc     blankJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0600 START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
       
      let strJson = inspector.getInspectorByKey('blankUIJsunit_blank');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0600'] component obj is: " + JSON.stringify(obj));
      let text_rect = CommonFunc.getComponentRect('text');
      let toggle_rect = CommonFunc.getComponentRect('toggle');
      console.info("[blankJsunit_static_0600'] text_rect is " + JSON.stringify(text_rect) + "toggle_rect is " + JSON.stringify(toggle_rect));
      
      let gaps = toggle_rect.left - text_rect.right;
      expect(gaps > 0).assertTrue();
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

/**
     * @tc.number   blankJsunit_static_0700
     * @tc.name     blankJsunit_static_0700
     * @tc.desc     blankJsunit_static_0700
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0700 START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
       
      let strJson = inspector.getInspectorByKey('blankUIJsunit_blank');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[blankJsunit_static_0700'] component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('Blank');
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#00000000');
     expect(obj.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();
    });

/**
     * @tc.number   blankJsunit_static_0800
     * @tc.name     blankJsunit_static_0800
     * @tc.desc     blankJsunit_static_0800
     * @tc.level    Level.LEVEL0
     */
it('blankJsunit_static_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('blankJsunit_static_0800 START');
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<number | string>("minWith",'rr')
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('blankUIJsunitTest await err: ' + JSON.stringify(err));
      }
      let strJson2 = inspector.getInspectorByKey('bl2');
     let obj2 = JSON.parseJsonElement(strJson2);
     console.info("[blankJsunit_static_0800'] component obj2 is: " + JSON.stringify(obj2));
     expect(obj2.getElement('$attrs').getString('min')).assertEqual('0.00vp');
      done();

    });


  })
}