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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import Utils from '../../../ets/MainAbility/common/Utils.ets';
import events_emitter from '@ohos.events.emitter';
import { MeasureOptions } from '@ohos.measure';
import { MeasureUtils } from '@ohos.arkui.UIContext';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';


export default function alertDialogCenterStartJsunit() {
  describe('alertDialogCenterStartTest', () => {
    beforeAll(() => {
      console.info("alertDialog beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("alertDialog beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/alertDialog2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get alertDialog state pages:" + JSON.stringify(pages));
        if (!("alertDialog2" == pages.name)) {
          console.info("get alertDialog pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push alertDialog page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push alertDialog page error:" + err);
      }
      console.info("alertDialog beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("alertDialogCenterStart after each called");
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0001
     * @tc.name         testalertDialogCenterStart_static_0001
     * @tc.desic         acealertDialogCenterStartEtsTest0001
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('testalertDialogCenterStart_static_0001', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('alertDialogCenterStart testalertDialogCenterStart_static_0001 START');
      let driver = Driver.create()
      await Utils.sleep(2000);
      try {
        let event: events_emitter.InnerEvent = {
          eventId: 81601,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("testalertDialogCenterStart_static_0001 get event data is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('Result')).assertEqual(true);
          console.info('testalertDialogCenterStart_static_0001 END');
          done();
        }
        console.info("testalertDialogCenterStart_static_0001 click result is: " + JSON.stringify(inspector.sendEventByKey('CenterStartButton', 10, "")));
        events_emitter.on(event, callback);
      } catch (err) {
        console.info("testalertDialogCenterStart_static_0001 on events_emitter err : " + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.text('button'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
    });

    /*
     * @tc.number       SUB_ACE_BASIC_ETS_API_0002
     * @tc.name         testMeasureText_static_0001
     * @tc.desic        test text width
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
     
    it('testMeasureText_static_0001', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('testMeasureText_static_0001 start');
      let driver = Driver.create()
      await Utils.sleep(2000);
      try {
        let measureOptions: MeasureOptions = {
          textContent: "alertDialog-CenterStart"
        };
        const uiContext = AppStorage.get<UIContext>("uiContext")
          let width = uiContext!.getMeasureUtils().measureText(measureOptions);
        console.info("++++++++++++++++++++++" + width.toString());
        expect(width > 0).assertTrue();
        done();
      } catch (err) {
        console.info("testMeasureText_static_0001 err : " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
      let button = await driver.findComponent(ON.text('button'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(1000);
    });

  })
}
