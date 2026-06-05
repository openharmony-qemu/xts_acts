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

export default function sideBarWithGesture() {
  describe('sideBarWithGesture', () => {
    beforeEach(async (done: Function) => {
      console.info('flex beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SideBarContainer/sideBarWithGesture',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get sideBarWithGesture state success ' + JSON.stringify(pages));
        if (!('sideBarWithGesture' == pages.name)) {
          console.info('get sideBarWithGesture state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push sideBarWithGesture page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push sideBarWithGesture page error: ' + err);
      }
      done()
    });

    /**
     * @tc.name   showSideBarWithGesture_0100
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_PARAM_0100
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[showSideBarWithGesture_0100] START');
      let strJson: string = getInspectorByKey('sideBarContainer_showSideBarWithGesture_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[showSideBarWithGesture_0100] type: " + JSON.parse(strJson).$attrs.type)
      console.info("[showSideBarWithGesture_0100] showSideBarWithGesture: " +
        JSON.stringify(obj.$attrs.showSideBarWithGesture));
      expect(obj.$attrs.type).assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.$attrs.showSideBarWithGesture).assertEqual('false');
      console.info('[showSideBarWithGesture_0100] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGesture_0200
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_PARAM_0200
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with true value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[showSideBarWithGesture_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let strJson: string = getInspectorByKey('sideBarContainer_showSideBarWithGesture_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[showSideBarWithGesture_0200] type: " + JSON.parse(strJson).$attrs.type)
      console.info("[showSideBarWithGesture_0200] showSideBarWithGesture: " +
        JSON.stringify(obj.$attrs.showSideBarWithGesture));
      expect(obj.$attrs.type).assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.$attrs.showSideBarWithGesture).assertEqual('true');

      let barComponent = await driver.findComponent(ON.id('sideBarContainer_showSideBarWithGesture_true'));
      console.info('[showSideBarWithGesture_0200] barComponent is ', barComponent);
      let barRect = await barComponent.getBounds();
      let right = barRect.right;
      let bottom = barRect.bottom;
      console.info('[showSideBarWithGesture_0200] right is ', right);
      console.info('[showSideBarWithGesture_0200] bottom is ', bottom);
      await driver.fling({x: Math.round(right/3), y: Math.round(bottom/2)}, {x: Math.round(right), y: Math.round(bottom/2)}, 2, 20000);
      await CommonFunc.sleep(2000);
      let strJson2: string = getInspectorByKey('sideBar2_true_text');
      console.info("[showSideBarWithGesture_0200] content: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('SideBar2');
      console.info('[showSideBarWithGesture_0200] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGesture_0300
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_PARAM_0300
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with false value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[showSideBarWithGesture_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      let strJson: string = getInspectorByKey('sideBarContainer_showSideBarWithGesture_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[showSideBarWithGesture_0300] type: " + JSON.parse(strJson).$attrs.type)
      console.info("[showSideBarWithGesture_0300] showSideBarWithGesture: " +
        JSON.stringify(obj.$attrs.showSideBarWithGesture));
      expect(obj.$attrs.type).assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.$attrs.showSideBarWithGesture).assertEqual('false');

      let barComponent = await driver.findComponent(ON.id('sideBarContainer_showSideBarWithGesture_false'));
      console.info('[showSideBarWithGesture_0300] barComponent is ', barComponent);
      let barRect = await barComponent.getBounds();
      let right = barRect.right;
      let bottom = barRect.bottom;
      console.info('[showSideBarWithGesture_0300] right is ', right);
      console.info('[showSideBarWithGesture_0300] bottom is ', bottom);
      await driver.fling({x: Math.round(right/3), y: Math.round(bottom/2)}, {x: Math.round(right), y: Math.round(bottom/2)}, 2, 20000);
      await CommonFunc.sleep(2000);
      let content = await driver.findComponent(ON.id('sideBar3_false_text'));
      console.info("[showSideBarWithGesture_0300'] content is: " + content);
      expect(content).assertEqual(null);
      console.info('[showSideBarWithGesture_0300] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGesture_0400
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_PARAM_0400
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[showSideBarWithGesture_0400] START');
      let strJsonCompare: string = getInspectorByKey('sideBarContainer_showSideBarWithGesture_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('sideBarContainer_showSideBarWithGesture_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[showSideBarWithGesture_0400] type: " + JSON.parse(strJson).$attrs.type)
      console.info("[showSideBarWithGesture_0400] showSideBarWithGesture: " +
        JSON.stringify(obj.$attrs.showSideBarWithGesture));
      expect(obj.$attrs.type).assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.$attrs.showSideBarWithGesture).assertEqual(objCompare.$attrs.showSideBarWithGesture);
      console.info('[showSideBarWithGesture_0400] END');
      done();
    });

    /**
     * @tc.name   showSideBarWithGesture_0500
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_SHOWSIDEBARWITHGESTURE_PARAM_0500
     * @tc.desc   Test SideBarContainer showSideBarWithGesture property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('showSideBarWithGesture_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[showSideBarWithGesture_0500] START');
      let strJsonCompare: string = getInspectorByKey('sideBarContainer_showSideBarWithGesture_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('sideBarContainer_showSideBarWithGesture_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[showSideBarWithGesture_0500] type: " + JSON.parse(strJson).$attrs.type)
      console.info("[showSideBarWithGesture_0500] showSideBarWithGesture: " +
        JSON.stringify(obj.$attrs.showSideBarWithGesture));
      expect(obj.$attrs.type).assertEqual('SideBarContainerType.DISPLACE');
      expect(obj.$attrs.showSideBarWithGesture).assertEqual(objCompare.$attrs.showSideBarWithGesture);
      console.info('[showSideBarWithGesture_0500] END');
      done();
    });
  });
}