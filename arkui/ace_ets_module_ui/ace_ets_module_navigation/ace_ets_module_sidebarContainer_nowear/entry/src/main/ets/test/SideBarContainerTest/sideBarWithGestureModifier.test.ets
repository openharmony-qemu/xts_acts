/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { Component, Driver, ON, MatchPattern, DisplayRotation, WindowMode} from '@ohos.UiTest';

export default function sideBarWithGestureModifier() {
  describe('sideBarWithGestureModifier', () => {
    beforeEach(async (done: Function) => {
      console.info('flex beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sideBarWithGestureModifier',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get sideBarWithGestureModifier state success ' + JSON.stringify(pages));
        if (!('sideBarWithGestureModifier' == pages.name)) {
          console.info('get sideBarWithGestureModifier state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push sideBarWithGestureModifier page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push sideBarWithGestureModifier page error: ' + err);
      }
      done()
    });

    /**
     * @tc.name   showSideBarWithGestureModifier_0100
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_showSideBarWithGestureModifier_PARAM_0100
     * @tc.desc   Test SideBarContainer showSideBarWithGestureModifier property with true value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGestureModifier_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[showSideBarWithGestureModifier_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let strJson: string = getInspectorByKey('showSideBarWithGesture_modifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[showSideBarWithGestureModifier_0100] type: " + JSON.parse(strJson).$attrs.type)
      console.info("[showSideBarWithGestureModifier_0100] showSideBarWithGesture: " +
        JSON.stringify(obj.$attrs.showSideBarWithGesture));
      expect(obj.$attrs.type).assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.$attrs.showSideBarWithGesture).assertEqual('false');

      let barComponent = await driver.findComponent(ON.id('showSideBarWithGesture_modifier'));
      console.info('[showSideBarWithGestureModifier_0100] barComponent is ', barComponent);
      let barRect = await barComponent.getBounds();
      let left = barRect.left;
      let right = barRect.right;
      let top = barRect.top;
      let bottom = barRect.bottom;
      let width = barRect.right - barRect.left;
      let height = barRect.bottom - barRect.top;
      console.info("showSideBarWithGestureModifier_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      console.info("showSideBarWithGestureModifier_0100 getBounds width: " + width + ", height: " + height);
      await driver.fling({x: Math.round(left + width/3), y: Math.round(top + height/2)}, {x: Math.round(right), y: Math.round(top + height/2)}, 2, 20000);
      await CommonFunc.sleep(2000);
      let strJson2: string = getInspectorByKey('showSideBarWithGesture_modifier_changeTxt');
      console.info("[showSideBarWithGestureModifier_0100] content: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onChange: init');
      console.info('[showSideBarWithGestureModifier_0100] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGestureModifier_0200
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_showSideBarWithGestureModifier_PARAM_0200
     * @tc.desc   Test SideBarContainer showSideBarWithGestureModifier property with false value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGestureModifier_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[showSideBarWithGestureModifier_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let btnClick = await driver.findComponent(ON.id('showSideBarWithGesture_modifier_true'));
      await btnClick.click();
      console.info('[showSideBarWithGestureModifier_0200] btnClick');
      await CommonFunc.sleep(1500);
      let strJson: string = getInspectorByKey('showSideBarWithGesture_modifier');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[showSideBarWithGestureModifier_0200] type: " + JSON.parse(strJson).$attrs.type)
      console.info("[showSideBarWithGestureModifier_0200] showSideBarWithGesture: " +
        JSON.stringify(obj.$attrs.showSideBarWithGesture));
      expect(obj.$attrs.type).assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.$attrs.showSideBarWithGesture).assertEqual('true');

      let barComponent = await driver.findComponent(ON.id('showSideBarWithGesture_modifier'));
      console.info('[showSideBarWithGestureModifier_0200] barComponent is ', barComponent);
      let barRect = await barComponent.getBounds();
      let left = barRect.left;
      let right = barRect.right;
      let top = barRect.top;
      let bottom = barRect.bottom;
      let width = barRect.right - barRect.left;
      let height = barRect.bottom - barRect.top;
      console.info("showSideBarWithGestureModifier_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      console.info("showSideBarWithGestureModifier_0200 getBounds width: " + width + ", height: " + height);
      await driver.fling({x: Math.round(left + width/3), y: Math.round(top + height/2)}, {x: Math.round(right), y: Math.round(top + height/2)}, 2, 20000);
      await CommonFunc.sleep(2000);
      let strJson2: string = getInspectorByKey('showSideBarWithGesture_modifier_changeTxt');
      console.info("[showSideBarWithGestureModifier_0200] content1: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onChange: Show sidebar');
      
      await CommonFunc.sleep(1000);
      console.info('[showSideBarWithGestureModifier_0200] (right - right/3) is ', (right - right/3));
      await driver.fling({x: Math.round(left + width*0.7), y: Math.round(top + height/2)}, {x: Math.round(left), y: Math.round(top + height/2)}, 2, 20000);
      await CommonFunc.sleep(2000);
      let strJson3: string = getInspectorByKey('showSideBarWithGesture_modifier_changeTxt');
      console.info("[showSideBarWithGestureModifier_0200] content2: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('onChange: Hide sidebar');
      console.info('[showSideBarWithGestureModifier_0200] END');
      done();
    });
  });
}