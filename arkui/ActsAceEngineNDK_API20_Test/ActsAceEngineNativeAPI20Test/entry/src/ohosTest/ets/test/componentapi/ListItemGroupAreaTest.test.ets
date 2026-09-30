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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium-dynamic";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";
import { ON, Component, Point } from '@kit.TestKit';

let displayID : number = AppStorage.get('displayID')?AppStorage.get('displayID') as number : 0

export default function ListItemGroupAreaTest() {
  describe('ListItemGroupAreaTest', () => {
    let Component: Component;
    let ComponentPoint: Point;
    let displayId: number;
    let y1: number;
    let y2: number;
    beforeAll(async (done: Function) => {
      await Utils.sleep(1000);
      await Utils.pushPageNoClear(`componentapi/ListItemGroupArea`);
      Component = await Utils.driver.findComponent(ON.id('SwiperList'));
      ComponentPoint = await Component.getBoundsCenter();
      displayId = await Component.getDisplayId();

      let rect = await Component.getBounds();
      let height = rect.bottom - rect.top;
      console.info("ListItemGroupAreaTest height is" + height);
      y1 = Math.round(rect.top + height * 0.2);
      y2 = Math.round(rect.bottom - height * 0.2);
      console.info("ListItemGroupAreaTest  centerX= " +  ComponentPoint.x  +
        ", y1 = " + y1  + ", y2 = " + y2 + ", displayId = " + displayId);
      done();
    })
    /**
     * @tc.name   testListItemGroupArea0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE_0100
     * @tc.desc   Test the ListItemGroup component area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupArea0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000);
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE_0100 start<====`);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y2, displayId: displayId },
          { x: ComponentPoint.x, y: y1, displayId: displayId }, 5000);
        await Utils.sleep(1000);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y1, displayId: displayId },
          { x: ComponentPoint.x, y: y2, displayId: displayId }, 5000);
        await Utils.sleep(1000);
        await Utils.driver.clickAt(
          { x: ComponentPoint.x, y: ComponentPoint.y, displayId: displayId });
        await Utils.sleep(1000);
        let result: number = nativexcomponent.TestAreaOutside();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_GROUP_AREA_OUTSIDE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testListItemGroupArea0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_NONE_0200
     * @tc.desc   Test the ListItemGroup component area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupArea0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000);
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_NONE_0200 start<====`);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y2, displayId: displayId },
          { x: ComponentPoint.x, y: y1, displayId: displayId }, 8000);
        await Utils.sleep(1000);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y1, displayId: displayId },
          { x: ComponentPoint.x, y: y2, displayId: displayId }, 8000);
        await Utils.sleep(1000);
        await Utils.driver.clickAt(
          { x: ComponentPoint.x, y: ComponentPoint.y, displayId: displayId });
        await Utils.sleep(1000);
        let result: number = nativexcomponent.TestAreaNone();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_NONE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testListItemGroupArea0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_ITEM_0300
     * @tc.desc   Test the ListItemGroup component area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupArea0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000);
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_ITEM_0300 start<====`);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y2, displayId: displayId },
          { x: ComponentPoint.x, y: y1, displayId: displayId }, 8000);
        await Utils.sleep(1000);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y1, displayId: displayId },
          { x: ComponentPoint.x, y: y2, displayId: displayId }, 8000);
        await Utils.sleep(1000);
        await Utils.driver.clickAt(
          { x: ComponentPoint.x, y: ComponentPoint.y, displayId: displayId });
        await Utils.sleep(1000);
        let result: number = nativexcomponent.TestAreaItem();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_ITEM_0300 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testListItemGroupArea0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_HEADER_0400
     * @tc.desc   Test the ListItemGroup component area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupArea0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000);
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_HEADER_0400 start<====`);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y2, displayId: displayId },
          { x: ComponentPoint.x, y: y1, displayId: displayId }, 8000);
        await Utils.sleep(1000);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y1, displayId: displayId },
          { x: ComponentPoint.x, y: y2, displayId: displayId }, 8000);
        await Utils.sleep(2000);
        await Utils.driver.clickAt(
          { x: ComponentPoint.x, y: ComponentPoint.y, displayId: displayId });
        await Utils.sleep(1000);
        let result: number = nativexcomponent.TestAreaHeader();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_HEADER_0400 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
    /**
     * @tc.name   testListItemGroupArea0500
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER_0500
     * @tc.desc   Test the ListItemGroup component area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testListItemGroupArea0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      await Utils.sleep(1000);
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER_0500 start<====`);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y2, displayId: displayId },
          { x: ComponentPoint.x, y: y1, displayId: displayId }, 8000);
        await Utils.sleep(1000);
        await Utils.driver.swipeBetween(
          { x: ComponentPoint.x, y: y1, displayId: displayId },
          { x: ComponentPoint.x, y: y2, displayId: displayId }, 8000);
        await Utils.sleep(1000);
        await Utils.driver.clickAt(
          { x: ComponentPoint.x, y: ComponentPoint.y, displayId: displayId });
        await Utils.sleep(1000);
        let result: number = nativexcomponent.TestAreaFooter();
        expect(1).assertEqual(result);
        done();
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_LIST_ITEM_SWIPE_AREA_FOOTER_0500 catch err: ` + err);
        expect(false).assertEqual(err);
        done();
      }
    })
  })
}