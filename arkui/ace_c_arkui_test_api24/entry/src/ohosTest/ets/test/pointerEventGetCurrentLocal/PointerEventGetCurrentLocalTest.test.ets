/*
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

import { beforeAll, describe, expect, it, Level, afterEach } from '@ohos/hypium';
import Utils from '../common/Utils';
import { Driver, ON } from '@ohos.UiTest';

export default function PointerEventGetCurrentLocalTest() {

  describe('PointerEventGetCurrentLocalTest', () => {

    let PAGE_TAG = 'PointerEventGetCurrentLocalTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`pointerEventGetCurrentLocal/${PAGE_TAG}`, done);
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_001
     * @tc.number PointerEventGetCurrentLocalTest_001
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalX normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_001', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_001] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalX');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_001] LocalX content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_001] END');
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_002
     * @tc.number PointerEventGetCurrentLocalTest_002
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalX null param test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_002', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_002] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalX');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_002] LocalX content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_002] END');
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_003
     * @tc.number PointerEventGetCurrentLocalTest_003
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalXByIndex normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_003', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_003] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalXByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_003] LocalXByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_003] END');
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_004
     * @tc.number PointerEventGetCurrentLocalTest_004
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalXByIndex null param test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_004', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_004] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalXByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_004] LocalXByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_004] END');
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_006
     * @tc.number PointerEventGetCurrentLocalTest_006
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalY normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_006', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_006] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalY');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_006] LocalY content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_006] END');
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_007
     * @tc.number PointerEventGetCurrentLocalTest_007
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalY null param test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_007', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_007] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalY');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_007] LocalY content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_007] END');
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_008
     * @tc.number PointerEventGetCurrentLocalTest_008
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalYByIndex normal test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_008', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_008] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalYByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_008] LocalYByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_008] END');
      done();
    });

    /**
     * @tc.name   PointerEventGetCurrentLocalTest_009
     * @tc.number PointerEventGetCurrentLocalTest_009
     * @tc.desc   OH_ArkUI_PointerEvent_GetCurrentLocalYByIndex null param test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PointerEventGetCurrentLocalTest_009', Level.LEVEL1, async (done: Function) => {
      console.info('[PointerEventGetCurrentLocalTest_009] START');
      let driver: Driver = Driver.create();
      let touchArea = await driver.findComponent(ON.id('touchAreaGetCurrentLocal'));
      await touchArea.click();
      await Utils.sleep(500);
      let strJson = getInspectorByKey('textResultGetCurrentLocalYByIndex');
      let obj: ESObject = JSON.parse(strJson);
      let content: string = obj.$attrs.content;
      console.info('[PointerEventGetCurrentLocalTest_009] LocalYByIndex content: ' + content);
      let parts = content.split(':');
      let value = parseFloat(parts[1]);
      expect(value).assertLargerOrEqual(0);
      console.info('[PointerEventGetCurrentLocalTest_009] END');
      done();
    });
  })
}