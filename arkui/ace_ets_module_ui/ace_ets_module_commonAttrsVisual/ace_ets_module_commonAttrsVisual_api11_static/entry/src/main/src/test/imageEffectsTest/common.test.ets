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

import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { RecordData } from '@ohos.base';

export default function commonColorModeJsunit() {
  describe('commonColorModeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("commonColorModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/common',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get commonColorModeTest state pages:" + JSON.stringify(pages));
        if (!("common" == pages.name)) {
          console.info("get commonColorModeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push commonColorModeTest page error:" + err);
      }
      console.info("commonColorModeTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('commonColorModeTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("commonColorMode after each called");
    });
    
/**
     * @tc.number   testCommonColorMode_static_0011
     * @tc.name     testCommonColorMode_static_0011
     * @tc.desc     testCommonColorMode_static_0011
     * @tc.level    Level.LEVEL2
     */
it('testCommonColorMode_static_0011', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonColorMode testCommonColorMode0011 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('ThinText');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[testCommonColorMode0011] component textAlign strJson:" + JSON.stringify(strJson));
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info("[testCommonColorMode0011] backgroundBlurStyle value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundBlurStyle'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundBlurStyle') instanceof Object)
        .assertTrue();
      done();
    });


    
    
/**
     * @tc.number   testCommonColorMode_static_0012
     * @tc.name     testCommonColorMode_static_0012
     * @tc.desc     testCommonColorMode_static_0012
     * @tc.level    Level.LEVEL2
     */
it('testCommonColorMode_static_0012', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonColorMode testCommonColorMode0012 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('ThickText');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[testCommonColorMode0012] component textAlign strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info("[testCommonColorMode0012] backgroundBlurStyle value :" + JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('backgroundBlurStyle'));

      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('backgroundBlurStyle') instanceof Object)
        .assertTrue();
      done();
    });


    
    
/**
     * @tc.number   testCommonMiddle_static_0013
     * @tc.name     testCommonMiddle_static_0013
     * @tc.desc     testCommonMiddle_static_0013
     * @tc.level    Level.LEVEL2
     */
it('testCommonMiddle_static_0013', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonMiddle testCommonMiddle0001 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('middleText');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[testCommonMiddle0001] component textAlign strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('alignRules')).assertEqual(undefined);
      done();
    });


    
    
/**
     * @tc.number   testCommonOutset_static_0014
     * @tc.name     testCommonOutset_static_0014
     * @tc.desc     testCommonOutset_static_0014
     * @tc.level    Level.LEVEL2
     */
it('testCommonOutset_static_0014', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonOutset testCommonOutset0001 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('outsetText');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[testCommonOutset0001] component textAlign strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info("[testCommonOutset0001] borderImage value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'))
        .getString('width')).assertEqual("10.00px");
      done();
    });


    
    
/**
     * @tc.number   testCommonRepeat_static_0015
     * @tc.name     testCommonRepeat_static_0015
     * @tc.desc     testCommonRepeat_static_0015
     * @tc.level    Level.LEVEL2
     */
it('testCommonRepeat_static_0015', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonRepeat testCommonRepeat0001 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('RepeatText');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[testCommonRepeat0001] component textAlign strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info("[testCommonOutset0001] borderImage value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'))
        .getString('width')).assertEqual("10.00px");
      done();
    });


    
    
/**
     * @tc.number   testCommonSpace_static_0016
     * @tc.name     testCommonSpace_static_0016
     * @tc.desc     testCommonSpace_static_0016
     * @tc.level    Level.LEVEL2
     */
it('testCommonSpace_static_0016', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonSpace testCommonSpace0001 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('SpaceText');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[testCommonSpace0001] component textAlign strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info("[testCommonSpace0001] borderImage value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'))
        .getString('width')).assertEqual("10.00px");
      done();
    });


    
    
/**
     * @tc.number   testCommonSlice_static_0017
     * @tc.name     testCommonSlice_static_0017
     * @tc.desc     testCommonSlice_static_0017
     * @tc.level    Level.LEVEL2
     */
it('testCommonSlice_static_0017', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonSlice testCommonSlice0001 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('sliceText');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("[testCommonSlice0001] component textAlign strJson:" + strJson);

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Text');
      console.info("[testCommonSlice0001] borderImage value :" +
      JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'));
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderImage'))
        .getString('width')).assertEqual("10.00px");
      done();
    });


    
    
/**
     * @tc.number   testCommonSlice_static_0018
     * @tc.name     testCommonSlice_static_0018
     * @tc.desc     testCommonSlice_static_0018
     * @tc.level    Level.LEVEL2
     */
it('testCommonSlice_static_0018', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('commonSlice testCommonArea0001 START');
      try {
        await Utils.sleep(500);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      try {
        let innerEvent: emitter.InnerEvent = {
          eventId: 60312,
          priority: emitter.EventPriority.LOW
        }
        let callback = (eventData: emitter.EventData) => {
          console.info("testCommonArea0001 get event state result is: " + JSON.stringify(eventData));
          const data: Record<String,RecordData> =
            eventData.data as Record<String,RecordData>
          expect(data['STATUS']).assertEqual(320);
        }
        emitter.on(innerEvent, callback);
        console.info("testCommonArea0001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('areaText', 10, "")));
        try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('commonColorModeTest sleep err: ' + JSON.stringify(err));
      }
      } catch (err) {
        console.info("testCommonArea0001 on click err : " + JSON.stringify(err));
      }
      done();
    });
  })
}
