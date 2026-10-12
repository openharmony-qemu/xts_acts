/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router'
import { Driver, Component, ON } from '@ohos.UiTest'
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';
import config from '@ohos.accessibility.config'
import accessibility from '@ohos.accessibility';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.scroll.list02/MainAbility';

export default function ListDeleteTest() {
  const SUITE: string = 'ListDelete'

  describe('ListDeleteTest', () => {
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      
      let options: router.RouterOptions = {
        url: "MainAbility/pages/List/ListDelete",
      }
      try {
        router.clear();
        let pages: router.RouterState = router.getState();
        if (pages == null || !("ListDelete" == pages.name)) {
          await router.pushUrl(options).then(() => {
            console.info(`${SUITE} router.pushUrl success`);
          })
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   ArkUI_List_Delete_0100
     * @tc.number ArkUI_List_Delete_0100
     * @tc.desc   Set swipeAction.end by CustomBuilder and edgeEffect is SwipeEdgeEffect.None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_List_Delete_0100', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_List_Delete_0100'
      console.info(`${SUITE} ${CASE} START`);
      await sleep(2000);
      let baseKey: string = 'MyList1_ListItem0'
      let strJson: string = getInspectorByKey(baseKey);
      console.info("the rect json is " + strJson);

      expect(JSON.parse(strJson).$attrs.startDeleteAreaDistance).assertEqual("0.00vp");
      expect(JSON.parse(strJson).$attrs.endDeleteAreaDistance).assertEqual("0.00vp");

      let driver: Driver = Driver.create()
      let itemComponent = await driver.findComponent(ON.id(baseKey));
      let itemRect = await itemComponent.getBounds();
      let displayId = await itemComponent.getDisplayId();
      let height = itemRect.bottom - itemRect.top;
      let centerY = Math.round(itemRect.top + height / 2);
      await driver.swipeBetween(
        { x: Math.round(itemRect.left + (itemRect.right - itemRect.left) * 0.75), y: centerY, displayId: displayId },
        { x: 0, y: centerY, displayId: displayId })
      await sleep(3000);
      let strJsonButtonDel: string = getInspectorByKey(baseKey + '_Button_Del');

      expect(JSON.parse(strJsonButtonDel).$attrs.visibility).assertEqual("Visibility.Visible");
      let strJsonButtonSet: string = getInspectorByKey(baseKey + '_Button_Set');

      expect(JSON.parse(strJsonButtonSet).$attrs.visibility).assertEqual("Visibility.Visible");

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /**
     * @tc.name   ArkUI_List_Delete_0200
     * @tc.number ArkUI_List_Delete_0200
     * @tc.desc   Set swipeAction.start by CustomBuilder and edgeEffect is SwipeEdgeEffect.None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_List_Delete_0200', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_List_Delete_0200'
      console.info(`${SUITE} ${CASE} START`);

      let baseKey: string = 'MyList2_ListItem0'
      let strJson: string = getInspectorByKey(baseKey);
      expect(JSON.parse(strJson).$attrs.startDeleteAreaDistance).assertEqual("0.00vp");
      expect(JSON.parse(strJson).$attrs.endDeleteAreaDistance).assertEqual("0.00vp");

      let driver: Driver = Driver.create()
      let swipeRectComponent = await driver.findComponent(ON.id('MyList2_ListItem0'));
      let swipeRect = await swipeRectComponent.getBounds();
      let displayId = await swipeRectComponent.getDisplayId();
      let top = swipeRect.top;
      let right = swipeRect.right;
      let left = swipeRect.left;
      let bottom = swipeRect.bottom;
      console.info("ArkUI_List_Delete_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipeBetween(
        { x: Math.round(left + width*0.4), y: Math.round(top + height/2), displayId: displayId },
        { x: Math.round(left + width*0.9), y: Math.round(top + height/2), displayId: displayId });
      await sleep(3000);
      let strJsonButtonDel: string = getInspectorByKey(baseKey + '_Button_Del');
      expect(JSON.parse(strJsonButtonDel).$attrs.visibility).assertEqual("Visibility.Visible");
      let strJsonButtonSet: string = getInspectorByKey(baseKey + '_Button_Set');

      expect(JSON.parse(strJsonButtonSet).$attrs.visibility).assertEqual("Visibility.Visible");

      console.info(`${SUITE} ${CASE} END`);
      done();
    });

    /**
     * @tc.name   ArkUI_List_Delete_0500
     * @tc.number ArkUI_List_Delete_0500
     * @tc.desc   Set swipeAction.end by SwipeActionItem and edgeEffect is SwipeEdgeEffect.Spring
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUI_List_Delete_0500', Level.LEVEL1, async (done: Function) => {
      let CASE: string = 'ArkUI_List_Delete_0500'
      console.info(`${SUITE} ${CASE} START`);

      let driver: Driver = Driver.create()
      await driver.delayMs(1000)
      let baseKey: string = 'MyList5_ListItem0'
      let strJson: string = getInspectorByKey(baseKey);

      expect(JSON.parse(strJson).$attrs.startDeleteAreaDistance).assertEqual("0.00vp");
      expect(JSON.parse(strJson).$attrs.endDeleteAreaDistance).assertEqual("5.00vp");

      let itemComponent = await driver.findComponent(ON.id(baseKey));
      let itemRect = await itemComponent.getBounds();
      let displayId = await itemComponent.getDisplayId();
      let height = itemRect.bottom - itemRect.top;
      let centerY = Math.round(itemRect.top + height / 2);
      await driver.swipeBetween(
        { x: Math.round(itemRect.left + (itemRect.right - itemRect.left) * 0.75), y: centerY, displayId: displayId },
        { x: 0, y: centerY, displayId: displayId })
      await sleep(3000);
      let strJson2: string = getInspectorByKey('MyList5ListItemOnDeleteH');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual("action trigger");
      console.info(`${SUITE} ${CASE} END`);
      done();
    });
  })
}

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void, reject) => {
    setTimeout(() => {
      resolve("sleep")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}