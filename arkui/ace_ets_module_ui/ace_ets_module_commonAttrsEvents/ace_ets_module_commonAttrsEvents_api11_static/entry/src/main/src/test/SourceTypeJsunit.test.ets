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
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../ets/MainAbility/common/Common';
import RectValue from '../../ets/MainAbility/common/Rect';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import events_emitter from '@ohos.events.emitter';
import { TouchObject, TouchType } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

interface Source {
  source: number
}

interface Eve {
  event: Source
}

export default function sourceTypeJsunit() {

  describe('sourceTypeJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("sourceTypeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/sourceType",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        if (!("touchAble" == pages.name)) {
          console.info("get touchAble state pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push sourceTypeJsunit page error:" + err);
      }
      console.info("sourceTypeJsunit beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("sourceType after each called");
    });

    
    /**
     * @tc.number   sourceTypeTest_static_0100
     * @tc.name     sourceTypeTest_static_0100
     * @tc.desc     sourceTypeTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('sourceTypeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(1000)
      } catch (err) {
        console.error("sourceTypeTest_static_0100 sleep error:" + err);
      }

      let rect = CommonFunc.getComponentRect('button')
      console.info("sourceTypeTest_static_0100 rectInfo is " + JSON.stringify(rect));
      let x_value: number = rect.left + (rect.right - rect.left) / 2
      let y_value: number = rect.top + (rect.bottom - rect.top) / 2
      console.info("sourceTypeTest_static_0100 onTouch location is: " + "[x]=== " + x_value + "   [y]===" + y_value);
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
      } as TouchObject
      let callback = (indexData: events_emitter.EventData) => {
        console.info("sourceTypeTest_static_0100 get event state result is: " + JSON.stringify(indexData));
        // let eve = indexData.data as Eve
        const data = indexData.data as Record<String,RecordData>
        const event = data['event'] as Record<String,RecordData>
        expect(event['source']).assertEqual(0)
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: 198,
        priority: events_emitter.EventPriority.LOW
      }
      try {
        events_emitter.on(innerEvent, callback)
      } catch (err) {
        console.info("sourceTypeTest_static_0100 on events_emitter err : " + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000)
      } catch (err) {
        console.error("sourceTypeTest_static_0100 sleep2 error:" + err);
      }
      console.info('sourceTypeTest_static_0100 testSendTouchEvent END');
      done();
    });
  })
}