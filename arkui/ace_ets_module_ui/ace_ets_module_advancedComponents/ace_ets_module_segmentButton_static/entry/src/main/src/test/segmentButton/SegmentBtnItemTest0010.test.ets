'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  describe,
  beforeEach,
  afterEach,
  it,
  expect,
  Level
} from '../../../../hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function SegmentBtnItem0010() {
  describe('SegmentBtnItem0010', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SegmentBtnItem0010 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/SegmentBtnItem0010',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SegmentBtnItem0010 state pages:" + JSON.stringify(pages));
        if (!("SegmentBtnItem0010" == pages.name)) {
          console.info("get SegmentBtnItem0010 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SegmentBtnItem0010 page error:" + err);
        expect().assertFail();
      }
      console.info("SegmentBtnItem0010 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("SegmentBtnItem0010 afterEach error: " + err);
      }
      console.info('SegmentBtnItem0010 after each called');
    });


    /**
     * @tc.name   SegmentBtnItem0010_0100
     * @tc.number SegmentBtnItem0010_0100
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentBtnItem0010_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      console.log("SegmentBtnItem0010_0100 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick = (await driver.findComponent(ON.text('a'))) as Component;
      await CommonFunc.sleep(500);
      await (textClick?.click() as Promise<void>);
      await CommonFunc.sleep(500);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.log("[SegmentBtnItem0010_0100] component btn0 is: ", JSON.stringify(btn0))
      expect(btn0.getElement('$attrs').getString('content')).assertEqual('a');
      expect(btn0.getElement('$attrs').getString('backgroundColor')).assertEqual('#00000000');
      expect(btn0.getElement('$attrs').getString('padding')).assertEqual('10.00vp');
      await CommonFunc.sleep(500);
      console.log("SegmentBtnItem0010_0100 ", "END");
      } catch (err) {
        console.error('[SegmentBtnItem0010_0100] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   SegmentBtnItem0010_0200
     * @tc.number SegmentBtnItem0010_0200
     * @tc.desc   api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentBtnItem0010_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      console.log("SegmentBtnItem0010_0200 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let textClick = (await driver.findComponent(ON.text('b'))) as Component;
      await CommonFunc.sleep(500);
      await (textClick?.click() as Promise<void>);
      await CommonFunc.sleep(500);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.log("[SegmentBtnItem0010_0200] component btn0 is: ", JSON.stringify(btn0))
      expect(btn0.getElement('$attrs').getString('content')).assertEqual('b');
      expect(btn0.getElement('$attrs').getString('fontColor')).assertEqual('#FFF7F7F7');
      expect(btn0.getElement('$attrs').getElement('backgroundBlurStyle').getString('value'))
        .assertEqual('BlurStyle.NONE');
      await CommonFunc.sleep(500);

      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.log("[SegmentBtnItem0010_0200_1] component btn1 is: ", JSON.stringify(btn1))
      expect(btn1.getElement('$attrs').getString('content')).assertEqual('f');
      expect(btn1.getElement('$attrs').getString('fontColor')).assertEqual('#FF004AAF');

      await CommonFunc.sleep(500);

      console.log("SegmentBtnItem0010_0200 ", "END");
      } catch (err) {
        console.error('[SegmentBtnItem0010_0200] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   SegmentBtnItem0010_0300
     * @tc.number SegmentBtnItem0010_0300
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentBtnItem0010_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      console.log("SegmentBtnItem0010_0300 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.log("[SegmentBtnItem0010_0300] component btn0 is: ", JSON.stringify(btn0))
      expect(btn0.getElement('$attrs').getString('content')).assertEqual('c');
      expect(btn0.getElement('$attrs').getString('fontSize')).assertEqual('18.00fp');
      expect(btn0.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      await CommonFunc.sleep(500);
      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.log("[SegmentBtnItem0010_0300_1] component btn1 is: ", JSON.stringify(btn1))
      expect(btn1.getElement('$attrs').getString('content')).assertEqual('h');
      expect(btn1.getElement('$attrs').getString('fontSize')).assertEqual('18.00fp');
      expect(btn1.getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      await CommonFunc.sleep(500);

      console.log("SegmentBtnItem0010_0300 ", "END");
      } catch (err) {
        console.error('[SegmentBtnItem0010_0300] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });
    /**
     * @tc.name   SegmentBtnItem0010_0400
     * @tc.number SegmentBtnItem0010_0400
     * @tc.desc   Test SegmentButton page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SegmentBtnItem0010_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      console.log("SegmentBtnItem0010_0400 ", "START");
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(500);
      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.log("[SegmentBtnItem0010_0400] component btn0 is: ", JSON.stringify(btn0))
      expect(btn0.getElement('$attrs').getElement('size').getString('width')).assertEqual('40.00vp');
      expect(btn0.getElement('$attrs').getElement('size').getString('height')).assertEqual('40.00vp');
      await CommonFunc.sleep(500);
      console.log("SegmentBtnItem0010_0400 ", "END");
      } catch (err) {
        console.error('[SegmentBtnItem0010_0400] error: ' + err);
        expect(false).assertTrue();
      }
      done();
    });

  })
}