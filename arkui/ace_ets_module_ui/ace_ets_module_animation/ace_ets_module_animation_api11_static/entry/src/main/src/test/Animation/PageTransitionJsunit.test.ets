/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from '../../../ets/MainAbility/common/Utils';
import { startAbility, UtilsTest } from '../Util.test';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RouteType } from '@ohos.arkui.component';
import { RecordData } from '@ohos.base';

export default function pageTransitionJsunit() {
  describe('pageTransitionJsunit', () => {

    beforeAll(() => {
      console.info("pageTransitionJsunit beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.animation.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("pageTransitionJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Animation/pageTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get pageTransitionJsunit state pages:" + JSON.stringify(pages));
        if (!("pageTransition" == pages.name)) {
          console.info("get pageTransitionJsunit pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push pageTransitionJsunit page error:" + err);
      }
      console.info("pageTransitionJsunit beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("pageTransition after each called");
    });

    /*
     * @tc.number    pageTransitionTest_static_0100
     * @tc.name      pageTransitionTest_static_0100
     * @tc.desc      pageTransitionTest_static_0100
     * @tc.level     2
     */
    it('pageTransitionTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('pageTransitionTest_static_0100 START');
      let strJson = inspector.getInspectorByKey('Navigator');
      console.info("pageTransitionTest_static_0100 component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$type')).assertEqual('Navigator');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString('target'))
        .assertEqual('pages/pageTransition2');
      console.info('pageTransitionTest_static_0100 END');
      done();
    });

    /*
     * @tc.number    pageTransitionTest_static_0200
     * @tc.name      pageTransitionTest_static_0200
     * @tc.desc      pageTransitionTest_static_0200
     * @tc.level     2
     */
    it('pageTransitionTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('pageTransitionTest_static_0200 START');
      let strJson = inspector.getInspectorByKey('Navigator');
      console.info("pageTransitionTest_static_0200 component strJson:" + strJson);
      console.info("pageTransitionTest_static_0200 component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('active')).assertEqual('false');
      console.info('pageTransitionTest_static_0200 END');
      done();
    });

    /*
     * @tc.number    pageTransitionTest_0300
     * @tc.name      pageTransitionTest_0300
     * @tc.desc      pageTransitionTest_0300
     * @tc.level     2
     */
    it('pageTransitionTest_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('pageTransitionTest_0300 START');
      let strJson = inspector.getInspectorByKey('Navigator');
      console.info("pageTransitionTest_0300 component strJson:" + strJson);
      console.info("pageTransitionTest_0300 component JSON.parse(strJson) is: " +
      JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')).assertEqual('NavigationType.Push');
      console.info('pageTransitionTest_0300 END');
      done();
    });

    /*
     * @tc.number    pageTransitionTest_static_0400
     * @tc.name      pageTransitionTest_static_0400
     * @tc.desc      pageTransitionTest_static_0400
     * @tc.level     2
     */
    it('pageTransitionTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('pageTransitionTest_static_0400 START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "scale": 6,
            "opacity": 5
          } as Record<string, RecordData>
        }
        let indexEvent: events_emitter.InnerEvent = {
          eventId: 145,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("pageTransitionTest_static_0400 start to publish emit");
        events_emitter.emit(indexEvent, eventData);
      } catch (err) {
        console.log("pageTransitionTest_static_0400 change component data error: " + (err as Error).message);
      }
      await Utils.sleep(4000);
      let callback = (indexEventOne: events_emitter.EventData) => {
        try {
          console.info("pageTransitionTest_static_0400 get state result is: " + JSON.stringify(indexEventOne));
          expect(((indexEventOne.data) as ESObject)?.getProperty('scale')).assertEqual(6);
          expect(((indexEventOne.data) as ESObject)?.getProperty('opacity')).assertEqual(5);
          expect(((indexEventOne.data) as ESObject)?.getProperty('type')).assertEqual(RouteType.Push);
        } catch (err) {
          console.info("pageTransitionTest_static_0400 get state result is err:  " + JSON.stringify(err));
        }
      }
      let indexEventOne: events_emitter.InnerEvent = {
        eventId: 144,
        priority: events_emitter.EventPriority.LOW
      } as events_emitter.InnerEvent
      try {
        events_emitter.on(indexEventOne, callback);
      } catch (err) {
        console.info("pageTransitionTest_static_0400 on events_emitter err : " + JSON.stringify(err));
      }
      console.info("pageTransitionTest_static_0400 click result is: " +
      JSON.stringify(inspector.sendEventByKey('Navigator', 10, "")));
      await UtilsTest.msSleep(2000)
      console.info('pageTransitionTest_static_0400 END');
      done();
    });
  })
}