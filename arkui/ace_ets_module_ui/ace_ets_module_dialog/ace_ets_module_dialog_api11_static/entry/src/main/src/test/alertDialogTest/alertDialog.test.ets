'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { MeasureOptions } from '@ohos.measure'
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import { UIContext, Router, MeasureUtils } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { RecordData } from '@ohos.base';


export default function alertDialogCenterStartJsunit() {
  describe('alertDialogCenterStartTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/alertDialog2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get alertDialog state pages: " + JSON.stringify(pages));
        if (!("alertDialog2" == pages.name)) {
          console.info("get alertDialog state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push alertDialog success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alertDialog page error: " + err);
      }
      // done()
    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      console.info("alertDialogCenterStart after each called");
    });


    
    
/**
     * @tc.number   testalertDialogCenterStart0001_static
     * @tc.name     testalertDialogCenterStart0001_static
     * @tc.desc     testalertDialogCenterStart0001_static
     * @tc.level    Level.LEVEL2
     */
it('testalertDialogCenterStart0001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('alertDialogCenterStart testalertDialogCenterStart0011 START');
      let driver = Driver.create()
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      try {
        let event: emitter.InnerEvent = {
          eventId: 81601,
          priority: emitter.EventPriority.LOW
        }
        let callback = (eventData: emitter.EventData) => {
          console.info("testalertDialogCenterStart0001_static get event data is: " + JSON.stringify(eventData));
          expect(((eventData.data) as Record<String,RecordData>)?.['Result']).assertEqual(true);
          console.info('testalertDialogCenterStart0001_static END');
          done();
        }
        console.info("testalertDialogCenterStart0001_static click result is: " +
        JSON.stringify(inspector.sendEventByKey('CenterStartButton', 10, "")));
        emitter.on(event, callback);
      } catch (err) {
        console.info("testalertDialogCenterStart0001_static on emitter err : " + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      let button;
      try {
        button = await driver.findComponent(ON.text('button'));
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
    });


    
    
/**
     * @tc.number   testMeasureText0001_static
     * @tc.name     testMeasureText0001_static
     * @tc.desc     testMeasureText0001_static
     * @tc.level    Level.LEVEL2
     */
it('testMeasureText0001_static', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('testMeasureText0001_static start');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      try {
        let measureOptions: MeasureOptions = {
          textContent: "alertDialog-CenterStart"
        };
        let uiContext: UIContext = AppStorage.get<UIContext>('uiContent') as UIContext
        let uiContextMeasure: MeasureUtils = uiContext.getMeasureUtils();
        let width: number = uiContextMeasure.measureText(measureOptions);
        console.info("++++++++++++++++++++++" + width.toString());
        expect(width > 0).assertTrue();
        done();
      } catch (err) {
        console.info("testMeasureText0001_static err : " + JSON.stringify(err));
        done();
      }
      let button;
      try {
        button = await driver.findComponent(ON.text('button'));
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('alertDialogTest await err: ' + JSON.stringify(err));
      }
    });

  })
}
