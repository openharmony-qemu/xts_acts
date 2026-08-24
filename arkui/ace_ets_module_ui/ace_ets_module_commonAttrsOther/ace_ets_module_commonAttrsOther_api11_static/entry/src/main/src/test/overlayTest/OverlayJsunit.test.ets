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
import emitter from '@ohos.events.emitter';
import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import { Alignment } from '@ohos.arkui.component'
import { RecordData } from '@ohos.base';

export default function overLayJsunit(): void {
  describe('overLayTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("overLayTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/overlay/overlay',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get overLayTest state pages:" + JSON.stringify(pages));
        if (!("overlay" == pages.name)) {
          console.info("get overLayTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push overLayTest page error:" + err);
      }
      console.info("overLayTest beforeEach end");
    });


    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('overLayTest afterEach sleep err: ' + JSON.stringify(err));
      }
      const routerInstance = AppStorage.get<Router>("router") as Router
      // routerInstance.back();
      console.info("overlay after each called");
    });

    
/**
     * @tc.number   testOverlay_static_01
     * @tc.name     testOverlay_static_01
     * @tc.desc     testOverlay_static_01
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[testOverlay01] START');
        await CommonFunc.sleep(1000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);

        console.info("[testOverlay01] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title'))
          .assertEqual("old title");
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getString('align')).assertEqual("Alignment.Bottom");
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('x')).assertEqual('0.00vp');
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('y')).assertEqual('-15.00vp');
        console.info('[testOverlay01] END');
      } catch (err) {
        console.info('testOverlay01 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    
/**
     * @tc.number   testOverlay_static_02
     * @tc.name     testOverlay_static_02
     * @tc.desc     testOverlay_static_02
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay02] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "title": "new title"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testOverlay02] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay02] change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);

        console.info("[testOverlay02] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title'))
          .assertEqual("new title");
        await CommonFunc.sleep(1000);
        console.info('testOverlay02 END');
      } catch (err) {
        console.info('testOverlay02 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    
/**
     * @tc.number   testOverlay_static_03
     * @tc.name     testOverlay_static_03
     * @tc.desc     testOverlay_static_03
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay03] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": Alignment.TopStart,
            "x": 30.0,
            "y": -30.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testOverlay03] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay03] change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);

        console.info("[testOverlay03] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getString('align')).assertEqual("Alignment.TopStart");
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('x')).assertEqual('30.00vp');
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('y')).assertEqual('-30.00vp');
        console.info('testOverlay03 END');
      } catch (err) {
        console.info('testOverlay03 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    
/**
     * @tc.number   testOverlay_static_04
     * @tc.name     testOverlay_static_04
     * @tc.desc     testOverlay_static_04
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay04] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('testOverlay04 sleep err: ' + JSON.stringify(err));
      }
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": "Alignment.Center"
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 143,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testOverlay04] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay04] change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);

        console.info("[testOverlay04] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getString('align')).assertEqual("Alignment.TopStart");
        console.info('testOverlay04 END');
      } catch (err) {
        console.info('testOverlay04 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    
/**
     * @tc.number   testOverlay_static_05
     * @tc.name     testOverlay_static_05
     * @tc.desc     testOverlay_static_05
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay05] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "align": '-1'
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testOverlay05] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay05] change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);

        console.info("[testOverlay05] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getString('align')).assertEqual("Alignment.TopStart");
        console.info('testOverlay05 END');
      } catch (err) {
        console.info('testOverlay05 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    
/**
     * @tc.number   testOverlay_static_06
     * @tc.name     testOverlay_static_06
     * @tc.desc     testOverlay_static_06
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_06', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay06] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "x": -30.0,
            "y": 30.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testOverlay06] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay06] change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);

        console.info("[testOverlay06] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('x')).assertEqual('-30.00vp');
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('y')).assertEqual('30.00vp');
        console.info('testOverlay06 END');
      } catch (err) {
        console.info('testOverlay06 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    
/**
     * @tc.number   testOverlay_static_07
     * @tc.name     testOverlay_static_07
     * @tc.desc     testOverlay_static_07
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_07', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay07] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "x": 1111111111.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testOverlay07] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay07] change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);

        console.info("[testOverlay07] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('x')).assertEqual('1111111111.00vp');
        console.info('testOverlay07 END');
      } catch (err) {
        console.info('testOverlay07 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });

    
/**
     * @tc.number   testOverlay_static_08
     * @tc.name     testOverlay_static_08
     * @tc.desc     testOverlay_static_08
     * @tc.level    Level.LEVEL0
     */
it('testOverlay_static_08', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[testOverlay08] START');
      try {
        let eventData: emitter.EventData = {
          data: {
            "y": 1111111111.0
          } as Record<String,RecordData>
        }
        let innerEvent: emitter.InnerEvent = {
          eventId: 1110,
          priority: emitter.EventPriority.LOW
        }
        console.info("[testOverlay08] start to publish emit");
        emitter.emit(innerEvent, eventData);
      } catch (err) {
        console.log("[testOverlay08] change component data error: " + err.message);
      }
      try {
        await CommonFunc.sleep(2000);
        let strJson = inspector.getInspectorByKey('overlay_overlay');
        await CommonFunc.sleep(2000);
        console.info("[testOverlay08] JSON.parseJsonElement(strJson) is: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay')));
        expect(JSON.parseJsonElement(strJson)
          .getElement('$attrs')
          .getElement('overlay')
          .getElement('options')
          .getElement('offset')
          .getString('x')).assertEqual('1111111111.00vp');
        console.info('testOverlay08 END');
      } catch (err) {
        console.info('testOverlay08 err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    });
  })
}
