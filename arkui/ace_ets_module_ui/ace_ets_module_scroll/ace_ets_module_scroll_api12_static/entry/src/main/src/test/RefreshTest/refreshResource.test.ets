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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { $r } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import { UtilsTest } from '../Util.test'
import {UtilsTest} from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function refreshResource() {
  describe('refreshResource', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("refresh beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Refresh/refreshResource',
      }
      try {
        const router = AppStorage.get<Router>("router",Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get refresh state pages:" + JSON.stringify(pages));
        if (!("refresh" == pages.name)) {
          console.info("get refresh state pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push refresh page result:");
        }
      } catch (err: Error) {
        console.error("push refresh page error:" + err);
      }
    });

    /**
     * @tc.number    SUB_ACE_RefreshResource_static_0100
     * @tc.desc      test list property
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */

    it('refreshResource_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('[refreshResource_static_0100] START');
      let strJson: string = inspector.getInspectorByKey('refreshResource');
      console.info("[refreshResource_static_0100] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("Refreshing...");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('refreshOffset')).assertEqual("64.00vp");
      console.info('refreshResource_static_0100 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RefreshResource_static_0200
     * @tc.desc      test list property
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */

    it('refreshResource_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('[refreshResource_static_0200] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_SpecialCharacters')
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_static_0200] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[refreshResource_static_0200] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshResource');

      console.info("[refreshResource_static_0200] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("*&^%$#@!~...");
      console.info('refreshResource_static_0200 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RefreshResource_static_0300
     * @tc.desc      test list property
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */

    it('refreshResource_static_0300', 0, async (done: () => void): Promise<void> => {
      console.info('[refreshResource_static_0300] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_ChineseCharacters')
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_static_0300] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[refreshResource_static_0300] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshResource');

      console.info("[refreshResource_static_0300] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("下拉刷新。。。");
      console.info('refreshResource_static_0300 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RefreshResource_static_0400
     * @tc.desc      test list property
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */

    it('refreshResource_static_0400', 0, async (done: () => void): Promise<void> => {
      console.info('[refreshResource_static_0400] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_Alphabet')
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_static_0400] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[refreshResource_static_0400] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshResource');

      console.info("[refreshResource_static_0400] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("abcabc");
      console.info('refreshResource_static_0400 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RefreshResource_static_0500
     * @tc.desc      test list property
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */

    it('refreshResource_static_0500', 0, async (done: () => void): Promise<void> => {
      console.info('[refreshResource_static_0500] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_VeryLongText')
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_static_0500] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[refreshResource_static_0500] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshResource');

      console.info("[refreshResource_static_0500] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本文本");
      console.info('refreshResource_static_0500 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RefreshResource_static_0600
     * @tc.desc      test list property
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */

    it('refreshResource_static_0600', 0, async (done: () => void): Promise<void> => {
      console.info('[refreshResource_static_0600] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_MixedContent')
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_static_0600] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[refreshResource_static_0600] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshResource');

      console.info("[refreshResource_static_0600] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("*&#123swq...");
      console.info('refreshResource_static_0600 END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_RefreshResource_static_0700
     * @tc.desc      test list property
     * @tc.level     Level 1
     * @tc.type
     * @tc.size
     */

    it('refreshResource_static_0700', 0, async (done: () => void): Promise<void> => {
      console.info('[refreshResource_static_0700] START');
      try {
        let eventData: events_emitter.EventData = {
          data: {
            "promptText": $r('app.string.Refresh_Numbers')
          } as Record<string, Object>
        }
        let innerEvent: events_emitter.InnerEvent = {
          eventId: 180,
          priority: events_emitter.EventPriority.LOW
        }
        console.info("[refreshResource_static_0700] start to publish emit:" + JSON.stringify(eventData.data));
        events_emitter.emit(innerEvent, eventData);
      } catch (err: Error) {
        console.log("[refreshResource_static_0700] change component data error: " + err.message);
      }
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('refreshResource');

      console.info("[refreshResource_static_0700] JSON.parse(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('promptText')).assertEqual("123456");
      console.info('refreshResource_static_0700 END');
      done();
    });

  });
}
