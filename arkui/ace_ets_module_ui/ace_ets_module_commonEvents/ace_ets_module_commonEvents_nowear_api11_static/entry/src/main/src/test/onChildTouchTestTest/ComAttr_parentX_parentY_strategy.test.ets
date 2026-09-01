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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, Component, Point } from '@ohos.UiTest';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
// import config from '@ohos.accessibility.config';
import accessibility from '@ohos.accessibility';
// const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.arkui.ace.commonEvents.api11/EntryAbility';

export default function parentX_parentY_strategy_Test() {
  describe('parentX_parentY_strategy_Test', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/onChildTouchTest/parentX',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get parentX_parentY_strategy_Test state pages:" + JSON.stringify(pages));
        if (!("parentX" == pages.name)) {
          console.info("get WaterFlow_WaterFlow pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push parentX_parentY_strategy_Test page error:" + err);
      }
      console.info("parentX_parentY_strategy_Test beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error('parentX_parentY_strategy_Test afterEach error: ' + err);
      }
      console.info("parentX_parentY_strategy_Test after each called");
    });



/**
     * @tc.number   parentX_parentY_strategy_Test_static_0100
     * @tc.name     parentX_parentY_strategy_Test_static_0100
     * @tc.desc     parentX_parentY_strategy_Test_static_0100
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[parentX_parentY_strategy_Test_static_0100] START');
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let row: Component|null = await driver.findComponent(ON.id('row'));
        if (row != null && row != undefined) {
          let point: Point = await (row.getBoundsCenter() as Promise<Point>);
          await CommonFunc.sleep(1000);
          await (driver?.click(Math.round(point.x.toDouble()).toInt(), Math.round(point.y.toDouble()).toInt()) as Promise<void>)
          await CommonFunc.sleep(3000);
          let strJson = inspector.getInspectorByKey('parentX');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[parentX_parentY_strategy_Test_static_0100] component obj is: " + JSON.stringify(obj));
          console.info("[parentX_parentY_strategy_Test_static_0100] content obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
          expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 200) <= 1).assertTrue();
          console.info('[parentX_parentY_strategy_Test_static_0100] END');
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('[parentX_parentY_strategy_Test_static_0100] error: ' + err);
      }
      done();
    });



/**
     * @tc.number   parentX_parentY_strategy_Test_static_0200
     * @tc.name     parentX_parentY_strategy_Test_static_0200
     * @tc.desc     parentX_parentY_strategy_Test_static_0200
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[parentX_parentY_strategy_Test_static_0200] START');
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let row: Component|null = await driver.findComponent(ON.id('row'));
        if (row != null && row != undefined) {
          let point: Point = await (row.getBoundsCenter() as Promise<Point>);
          await CommonFunc.sleep(1000);
          await (driver?.click(Math.round(point.x).toInt(), Math.round(point.y).toInt()) as Promise<void>)
          await CommonFunc.sleep(3000);
          let strJson = inspector.getInspectorByKey('parentY');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[parentX_parentY_strategy_Test_static_0200] component obj is: " + JSON.stringify(obj));
          console.info("[parentX_parentY_strategy_Test_static_0200] contentY is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
          expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 200) <= 1).assertTrue();
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('[parentX_parentY_strategy_Test_static_0200] error: ' + err);
      }
      done();
    });



/**
     * @tc.number   parentX_parentY_strategy_Test_static_0300
     * @tc.name     parentX_parentY_strategy_Test_static_0300
     * @tc.desc     parentX_parentY_strategy_Test_static_0300
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[parentX_parentY_strategy_Test_static_0300] START');
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let row: Component|null = await driver.findComponent(ON.id('row'));
        if (row != null && row != undefined) {
          let point: Point = await (row.getBoundsCenter() as Promise<Point>);
          await CommonFunc.sleep(1000);
          await (driver?.click(Math.round(point.x).toInt(), Math.round(point.y).toInt()) as Promise<void>)
          await CommonFunc.sleep(3000);
          let strJson = inspector.getInspectorByKey('strategy_DEFAULT');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[parentX_parentY_strategy_Test_static_0300] component obj is: " + JSON.stringify(obj));
          console.info("[parentX_parentY_strategy_Test_static_0300] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
          expect(Math.abs(Number(obj.getElement('$attrs').getString('content'))) <= 1).assertTrue();
          console.info('[parentX_parentY_strategy_Test_static_0300] END');
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('[parentX_parentY_strategy_Test_static_0300] error: ' + err);
      }
      done();
    });



/**
     * @tc.number   parentX_parentY_strategy_Test_static_0400
     * @tc.name     parentX_parentY_strategy_Test_static_0400
     * @tc.desc     parentX_parentY_strategy_Test_static_0400
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[parentX_parentY_strategy_Test_static_0400] START');
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let row: Component|null = await driver.findComponent(ON.id('row'));
        if (row != null && row != undefined) {
          let point: Point = await (row.getBoundsCenter() as Promise<Point>);
          await CommonFunc.sleep(1000);
          await (driver?.click(Math.round(point.x).toInt(), Math.round(point.y).toInt()) as Promise<void>)
          await CommonFunc.sleep(3000);
          let strJson = inspector.getInspectorByKey('strategy_FORWARD_COMPETITION');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[parentX_parentY_strategy_Test_static_0400] component obj is: " + JSON.stringify(obj));
          console.info("[parentX_parentY_strategy_Test_static_0400] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
          expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 1) <= 1).assertTrue();
          console.info('[parentX_parentY_strategy_Test_static_0400] END');
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('[parentX_parentY_strategy_Test_static_0400] error: ' + err);
      }
      done();
    });



/**
     * @tc.number   parentX_parentY_strategy_Test_static_0500
     * @tc.name     parentX_parentY_strategy_Test_static_0500
     * @tc.desc     parentX_parentY_strategy_Test_static_0500
     * @tc.level    Level.LEVEL0
     */
it('parentX_parentY_strategy_Test_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('[parentX_parentY_strategy_Test_static_0500] START');
        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let row: Component|null = await driver.findComponent(ON.id('row'));
        if (row != null && row != undefined) {
          let point: Point = await (row.getBoundsCenter() as Promise<Point>);
          await CommonFunc.sleep(1000);
          await (driver?.click(Math.round(point.x).toInt(), Math.round(point.y).toInt()) as Promise<void>)
          await CommonFunc.sleep(3000);
          let strJson = inspector.getInspectorByKey('strategy_FORWARD');
          let obj = JSON.parseJsonElement(strJson);
          console.info("[parentX_parentY_strategy_Test_static_0500] component obj is: " + JSON.stringify(obj));
          console.info("[parentX_parentY_strategy_Test_static_0500] component obj is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
          expect(Math.abs(Math.abs(Number(obj.getElement('$attrs').getString('content'))) - 2) <= 1).assertTrue();
          console.info('[parentX_parentY_strategy_Test_static_0500] END');
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error('[parentX_parentY_strategy_Test_static_0500] error: ' + err);
      }
      done();
    });
  })
}
