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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils.ets';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { TouchObject, TouchType } from '@ohos.arkui.component';
import { sendTouchEvent } from '@internal.full.global';

export default function ResponseRegionJsunit() {
  describe('responseRegionTest', () => {
    let x_value: number;
    let y_value: number;

    beforeAll(() => {
      console.info("ResponseRegion beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("ResponseRegion beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/ResponseRegion',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ResponseRegion state pages:" + JSON.stringify(pages));
        if (!("ResponseRegion" == pages.name)) {
          console.info("get ResponseRegion pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ResponseRegion page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ResponseRegion page error:" + err);
      }
      console.info("ResponseRegion beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(1000);
      console.info("ResponseRegion after each called");
    });

    it('testResponseRegion01', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('[testResponseRegion01] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "touchable": true,
          } as Record<string,Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 30,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[testResponseRegion01] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[testResponseRegion01] change component data error: " + err?.message);
      }
      await Utils.sleep(1000);
      console.info('[testResponseRegion01] END');
      done();
    });

    it('testResponseRegion02', Level.LEVEL2,async (done: () => void): Promise<void> => {
      let rect = Utils.getComponentRect('region')
      console.info("[testResponseRegion02] rectInfo is " + JSON.stringify(rect));
      x_value = rect.left + (rect.right - rect.left) / 10
      y_value = rect.top + (rect.bottom - rect.top) / 10
      console.info("[testResponseRegion02] onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
      let point: TouchObject = {
        id: 1,
        x: x_value,
        y: y_value,
        type: TouchType.Down,
        // screenX: 0,
        // screenY: 0,
        windowX: 0,
        windowY: 0,
        displayX: 0,
        displayY: 0
      }
      let callbackTwo = (eventData: events_emitter.EventData) => {
        console.info("[testResponseRegion02] get event state result is: " + JSON.stringify(eventData));
        expect(((eventData.data) as ESObject)?.getProperty('ACTION')).assertEqual(true)
        expect(((eventData.data) as ESObject)?.getProperty('EVENT_TYPE')).assertEqual('Down')
        done();
      }
      let innerEventTwo: events_emitter.InnerEvent = {
        eventId: 31,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEventTwo, callbackTwo)
      } catch (err) {
        console.info("[testResponseRegion02] on events_emitter err : " + JSON.stringify(err));
      }
      console.info('[testResponseRegion02] testSendTouchEvent ' + sendTouchEvent(point));
      await Utils.sleep(1000)
      console.info('[testResponseRegion02] END');
    });
  })
}
