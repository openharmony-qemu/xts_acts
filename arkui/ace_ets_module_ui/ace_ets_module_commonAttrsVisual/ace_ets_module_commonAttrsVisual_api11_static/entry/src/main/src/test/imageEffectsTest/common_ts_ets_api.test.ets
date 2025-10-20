/*
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

import events_emitter from '@ohos.events.emitter';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
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
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import { Font, Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import font from '@ohos.font'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
const font = new Font()

export default function common_ts_ets_apiStaticClearJsunit() {
  describe('common_ts_ets_apiStaticClearTest', () => {
    beforeAll(() => {
      console.info("common_ts_ets_apiStaticClearJsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.commonAttrsVisual.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("common_ts_ets_apiStaticClearTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/imageEffects/common_ts_ets_api',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get common_ts_ets_apiStaticClearTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get common_ts_ets_apiStaticClearTest pages.name:" + JSON.stringify(pages.name));

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push common_ts_ets_apiStaticClearTest page error:" + err);
      }
      console.info("common_ts_ets_apiStaticClearTest beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("common_ts_ets_apiStaticClear after each called");
    });


    /*
     * @tc.number    testcommon_ts_ets_apiPersistProp_static__static_0001
     * @tc.name      testcommon_ts_ets_apiPersistProp_static__static_0001
     * @tc.desc      testcommon_ts_ets_apiPersistProp_static__static_0001
     * @tc.level     2
     */
    it('testcommon_ts_ets_apiPersistProp_static__static_0001', Level.LEVEL2, async () => {
      console.info('common_ts_ets_apiPersistProp testcommon_ts_ets_apiPersistProp0001 START');
      await Utils.sleep(2000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60230,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("common_ts_ets_apiPersistProp0001 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('Score')).assertEqual("Score");
        }
        console.info("PersistProp0001 click result is: " +
        JSON.stringify(inspector.sendEventByKey('PersistPropText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("common_ts_ets_apiPersistProp0001 on events_emitter err : " + JSON.stringify(err));
      }
    });


    /*
     * @tc.number    testcommon_ts_ets_apiEnvProp_static_0001
     * @tc.name      testcommon_ts_ets_apiEnvProp_static_0001
     * @tc.desc      testcommon_ts_ets_apiEnvProp_static_0001
     * @tc.level     2
     */
    it('testcommon_ts_ets_apiEnvProp_static_0001', Level.LEVEL2, async () => {
      console.info('common_ts_ets_apiEnvProp testcommon_ts_ets_apiEnvProp0001 START');
      await Utils.sleep(2000);
      try {
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 60231,
          priority: events_emitter.EventPriority.LOW
        }
        let callback = (eventData: events_emitter.EventData) => {
          console.info("common_ts_ets_apiEnvProp0001 get event state result is: " + JSON.stringify(eventData));
          expect(((eventData.data) as ESObject)?.getProperty('Result')).assertEqual(false);
        }
        console.info("EnvProp0001 click result is: " + JSON.stringify(inspector.sendEventByKey('EnvPropText', 10, "")));
        events_emitter.on(innerEvent, callback);
      } catch (err) {
        console.info("common_ts_ets_apiEnvProp0001 on events_emitter err : " + JSON.stringify(err));
      }
    });


    /*
     * @tc.number    test_font_registerFont__static_0001
     * @tc.name      test_font_registerFont__static_0001
     * @tc.desc      test_font_registerFont__static_0001
     * @tc.level     2
     */
    it('test_font_registerFont__static_0001', Level.LEVEL2, async () => {
      console.info('test_font_registerFont_0001 Register a customized font in the FontManagerSTART');
      await Utils.sleep(2000);

      let fontOptions: font.FontOptions = {
        familyName: "Italy",
        familySrc: "resource/base/Italy"
      }
      try {


      } catch (err) {
        console.info("test_font_registerFont_0001  err : " + JSON.stringify(err));
        expect().assertFail();

      }
    });


  })
}
