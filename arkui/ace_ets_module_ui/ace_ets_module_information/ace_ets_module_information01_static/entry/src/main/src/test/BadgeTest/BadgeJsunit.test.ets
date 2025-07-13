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
import { describe, beforeEach, afterEach, it, expect, beforeAll } from "../../../../hypium/index";
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;


function sleep(time: number) {
  return new Promise<string>((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function badgeJsunit() {

  describe('badgeTest', () => {

    beforeAll(() => {
      console.info("badgeJsunit beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async () => {
      await sleep(1);
      console.info("Badge after each called");
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0600
     * @tc.name testBadge_static_010
     * @tc.desc aceEtsTest
     */
    it('testBadge_static_010', 0, async (done: () => void): Promise<void> => {
      console.info('new Badge0 START');
      let strJson = inspector.getInspectorByKey('badge');
      let obj = JSON.parseJsonElement(strJson);
      let style = obj.getElement('$attrs').getElement('style');
      expect(obj.getElement('$type')).assertEqual('Badge');
      console.log(JSON.stringify(obj.getElement('$type')));
      console.info("yr badge0 type: " + JSON.stringify(obj.getElement('$type')));
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('count')).assertEqual('33');
      console.log("yr badge0 count-'33'" + JSON.stringify(obj.getElement('$attrs').getElement('count')));
      expect(obj.getElement('$attrs').getElement('position')).assertEqual('BadgePosition.Right');
      console.log("yr badge0 position-BadgePosition.Right" +
      JSON.stringify(obj.getElement('$attrs').getElement('position')));
      expect(obj.getElement('$attrs').getElement('maxCount')).assertEqual('99');
      console.log("yr badge0 maxCount-'99'" + JSON.stringify(obj.getElement('$attrs').getElement('maxCount')));
      console.log("yr badge0 style.color" + style.getElement('color'));
      console.log("yr badge0 style.fontSize" + style.getElement('style').getElement('fontSize'));
      console.log("yr badge0 style.badgeSize" + style.getElement('style').getElement('badgeSize'));
      expect(style.getElement('color')).assertEqual('#FFFFFFFF');
      expect(style.getElement('fontSize')).assertEqual('16.00fp');
      expect(style.getElement('badgeSize')).assertEqual('20.00fp');
      console.log("badge0 style : " + JSON.stringify(obj.getElement('$attrs').getElement('style')));
      console.info('testGetInspectorByKey END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0610
     * @tc.name testBadge_static_020
     * @tc.desc aceEtsTest
     */
    it('testBadge_static_020', 0, async (done: () => void): Promise<void> => {
      console.info('new Badge1 START');
      let strJson = inspector.getInspectorByKey('badge1');
      let obj = JSON.parseJsonElement(strJson);
      let style = obj.getElement('$attrs').getElement('style');
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('position')).assertEqual('BadgePosition.RightTop');
      console.log("yr badge1 position-'BadgePosition.RightTop'" +
      JSON.stringify(obj.getElement('$attrs').getElement('position')));
      console.log("yr badge0 style.fontSize" + style.getElement('fontSize'));
      console.log("yr badge0 style.badgeSize" + style.getElement('badgeSize'));
      expect(style.getElement('fontSize')).assertEqual('16.00fp');
      expect(style.getElement('badgeSize')).assertEqual('20.00fp');
      console.info('new Badge1 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0620
     * @tc.name testBadge_static_030
     * @tc.desc aceEtsTest
     */
    it('testBadge_static_030', 0, async (done: () => void): Promise<void> => {
      console.info('new Badge2 START');
      let strJson = inspector.getInspectorByKey('badge2');
      let obj = JSON.parseJsonElement(strJson);
      console.info("component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getElement('position')).assertEqual('BadgePosition.Left');
      console.log("yr badge2 position-'BadgePosition.Left'" +
      JSON.stringify(obj.getElement('$attrs').getElement('position')));
      console.info('testGetInspectorByKey END');
      done();
    });
  }

  )
}
