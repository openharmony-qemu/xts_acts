/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level} from "../../../../hypium/index";
import router from '@ohos.router';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import { EnterKeyType } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../Util.test';
import { AppStorage } from '@ohos.arkui.stateManagement';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';

function sleep(time: int) {
  return new Promise<int>((resolve,reject) => {
    setTimeout(() => {
      resolve(0)
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function badgeJsunit() {

  describe('badgeTest', () => {
    beforeAll(() => {
      console.info("badgeJsunit beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.information.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Badge/Badge',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Badge state success " + JSON.stringify(pages));
        if (!("Badge" == pages.name)) {
          console.info("get Badge state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push Badge page error " + JSON.stringify(err));
      }
      await sleep(2);
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Badge after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0600
     * @tc.name testBadge010
     * @tc.desc aceEtsTest
     */
    it('testBadge_static_010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new Badge0 START');
      let strJson = inspector.getInspectorByKey('badge');
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      expect(obj.getString('$type')).assertEqual('Badge');
      console.log(JSON.stringify(obj.getString('$type')));
      console.info("yr badge0 type: " + JSON.stringify(obj.getString('$type')));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('count')).assertEqual('33');
      console.log("yr badge0 count-'33'" + JSON.stringify(obj.getElement('$attrs').getString('count')));
      expect(obj.getElement('$attrs').getString('position')).assertEqual('BadgePosition.Right');
      console.log("yr badge0 position-BadgePosition.Right" + JSON.stringify(obj.getElement('$attrs').getString('position')));
      expect(obj.getElement('$attrs').getString('maxCount')).assertEqual('99');
      console.log("yr badge0 maxCount-'99'" + JSON.stringify(obj.getElement('$attrs').getString('maxCount')));
      console.log("yr badge0 style.getString('color')" + style.getString('color'));
      console.log("yr badge0 style.getString('fontSize')" + style.getString('fontSize'));
      console.log("yr badge0 style.getString('badgeSize')" + style.getString('badgeSize'));
      expect(style.getString('color')).assertEqual('#FFFFFFFF');
      expect(style.getString('fontSize')).assertEqual('16.00fp');
      expect(style.getString('badgeSize')).assertEqual('20.00fp');
      console.log("badge0 style : " + JSON.stringify(obj.getElement('$attrs').getString('style')));
      console.info('testinspector.getInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0610
     * @tc.name testBadge020
     * @tc.desc aceEtsTest
     */
    it('testBadge_static_020', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new Badge1 START');
      let strJson = inspector.getInspectorByKey('badge1');
      let obj = JSON.parseJsonElement(strJson);
      let style = JSON.parseJsonElement(obj.getElement('$attrs').getString('style'));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('position')).assertEqual('BadgePosition.RightTop');
      console.log("yr badge1 position-'BadgePosition.RightTop'" + JSON.stringify(obj.getElement('$attrs').getString('position')));
      console.log("yr badge0 style.getString('fontSize')" + style.getString('fontSize'));
      console.log("yr badge0 style.getString('badgeSize')" + style.getString('badgeSize'));
      expect(style.getString('fontSize')).assertEqual('16.00fp');
      expect(style.getString('badgeSize')).assertEqual('20.00fp');
      console.info('new Badge1 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0620
     * @tc.name testBadge030
     * @tc.desc aceEtsTest
     */
    it('testBadge_static_030', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('new Badge2 START');
      let strJson = inspector.getInspectorByKey('badge2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('position')).assertEqual('BadgePosition.Left');
      console.log("yr badge2 position-'BadgePosition.Left'" + JSON.stringify(obj.getElement('$attrs').getString('position')));
      console.info('testinspector.getInspectorByKey END');
      done();
    });
  }

  )
}
