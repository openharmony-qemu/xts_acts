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

import { Component, Driver,  ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { GlobalContext } from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { LineCapStyle,Length } from '@ohos.arkui.component'
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
const waitUiReadyMs = 1000;

export default function dividerUIJsunit() {
  describe('dividerUIJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("dividerUIJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/dividerUI',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get dividerUIJsunit state pages:" + "");
        if (!("dividerUI" == pages.name)) {
          console.info("get dividerUIJsunit state pages.name:" + "");
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000)
        }
      } catch (err) {
          console.error("push dividerUIJsunit page error:" + err);
	        expect().assertFail();
      }
    });

/**
     * @tc.number   dividerUIJsunit_static_0100
     * @tc.name     dividerUIJsunit_static_0100
     * @tc.desc     dividerUIJsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
       console.info('dividerUIJsunit_static_0100 START');
       try {
       await CommonFunc.sleep(1000);
       } catch (err) {
       console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
       }

       let strJson = inspector.getInspectorByKey('dividerUI' + '_divider');
      let obj = JSON.parseJsonElement(strJson);
      console.info("dividerUIJsunit_static_0100'] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('vertical')).assertEqual('false');
      expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('20.00vp');
      expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('BUTT');
      expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFF0000');
       done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0200
     * @tc.name     dividerUIJsunit_static_0200
     * @tc.desc     dividerUIJsunit_static_0200
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0200 START');
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }

      AppStorage.setOrCreate<number|string>("strokeWidth",'30')
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<LineCapStyle>("lineCapStyle",LineCapStyle.Round)
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<string>("color",'#FFFFFF')
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('dividerUI' + '_divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0200'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('lineCap')));
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('30.00vp');
     expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('ROUND');
     expect(obj.getElement('$attrs').getString('color')).assertEqual('#FFFFFFFF');
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0300
     * @tc.name     dividerUIJsunit_static_0300
     * @tc.desc     dividerUIJsunit_static_0300
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0300 START');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<LineCapStyle>("lineCapStyle",LineCapStyle.Square)
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }

     let strJson = inspector.getInspectorByKey('dividerUI' + '_divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0300'] component obj is: " + obj.getElement('$attrs').getString('lineCap'));
     expect(obj.getElement('$attrs').getString('lineCap')).assertEqual('SQUARE');
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0400
     * @tc.name     dividerUIJsunit_static_0400
     * @tc.desc     dividerUIJsunit_static_0400
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0400 START');
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<string|number>("strokeWidth",'-30')
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(200);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('dividerUI' + '_divider');
     let obj = JSON.parseJsonElement(strJson);
     expect(obj.getElement('$attrs').getString('strokeWidth')).assertEqual('-30.00vp');
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0500
     * @tc.name     dividerUIJsunit_static_0500
     * @tc.desc     dividerUIJsunit_static_0500
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0500 START');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<Length>("widthK",'1.0')
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      
      let strJson = inspector.getInspectorByKey('dividerUI' + '_divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0500'] component obj is: " + JSON.stringify(obj));
     expect(obj.getElement('$attrs').getString('width')).assertEqual('1.00vp')
      done();
    });

/**
     * @tc.number   dividerUIJsunit_static_0600
     * @tc.name     dividerUIJsunit_static_0600
     * @tc.desc     dividerUIJsunit_static_0600
     * @tc.level    Level.LEVEL0
     */
it('dividerUIJsunit_static_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('dividerUIJsunit_static_0600 START');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }
      AppStorage.setOrCreate<boolean>("vertical",true)
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
      console.info('dividerUIJsunitTest await err: ' + JSON.stringify(err));
      }

      let strJson = inspector.getInspectorByKey('dividerUI' + '_divider');
     let obj = JSON.parseJsonElement(strJson);
     console.info("[dividerUIJsunit_static_0600'] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('vertical')));
     expect(obj.getElement('$attrs').getString('vertical')).assertEqual('true');
      done();
    });
    
  })
}