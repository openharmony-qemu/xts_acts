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
import { Driver, ON, Component } from '@ohos.UiTest';



export default function dragEventSummaryTest() {
  describe('dragEventSummaryTest', () => {

    afterEach(async (done: Function) => {
      await Utils.sleep(200);
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_RETURN_0001
     * @tc.name      SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_RETURN_0001
     * @tc.desc      Test OH_ArkUI_DragEvent_GetSummary with valid event and summary returns NO_ERROR
     * @tc.level     LEVEL0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_RETURN_0001', Level.LEVEL0, async (done: Function) => {
      console.info('[GETSUMMARY_RETURN_0001] START');
      await Utils.sleep(500);
      await Utils.pushPage('dragEventSummary/DragEventSummaryTest');
      await Utils.sleep(2000);

      let driver = await Driver.create();
      let image = await driver.findComponent(ON.id('drag_image'));
      let dropArea = await driver.findComponent(ON.id('drop_area'));
      expect(image != null).assertTrue();
      expect(dropArea != null).assertTrue();

      await image.dragTo(dropArea);
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GETSUMMARY_RETURN_0001] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC1=0');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0001
     * @tc.name      SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0001
     * @tc.desc      Test OH_ArkUI_DragEvent_GetSummary with NULL event returns PARAM_INVALID
     * @tc.level     LEVEL0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0001', Level.LEVEL0, async (done: Function) => {
      console.info('[GETSUMMARY_ERROR_0001] START');
      await Utils.sleep(500);
      await Utils.pushPage('dragEventSummary/DragEventSummaryTest');
      await Utils.sleep(2000);

      let driver = await Driver.create();
      let image = await driver.findComponent(ON.id('drag_image'));
      let dropArea = await driver.findComponent(ON.id('drop_area'));
      await image.dragTo(dropArea);
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GETSUMMARY_ERROR_0001] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC2=401');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0002
     * @tc.name      SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0002
     * @tc.desc      Test OH_ArkUI_DragEvent_GetSummary with NULL summary returns PARAM_INVALID
     * @tc.level     LEVEL0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0002', Level.LEVEL0, async (done: Function) => {
      console.info('[GETSUMMARY_ERROR_0002] START');
      await Utils.sleep(500);
      await Utils.pushPage('dragEventSummary/DragEventSummaryTest');
      await Utils.sleep(2000);

      let driver = await Driver.create();
      let image = await driver.findComponent(ON.id('drag_image'));
      let dropArea = await driver.findComponent(ON.id('drop_area'));
      await image.dragTo(dropArea);
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GETSUMMARY_ERROR_0002] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC3=401');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0003
     * @tc.name      SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0003
     * @tc.desc      Test OH_ArkUI_DragEvent_GetSummary with both NULL returns PARAM_INVALID
     * @tc.level     LEVEL0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0003', Level.LEVEL0, async (done: Function) => {
      console.info('[GETSUMMARY_ERROR_0003] START');
      await Utils.sleep(500);
      await Utils.pushPage('dragEventSummary/DragEventSummaryTest');
      await Utils.sleep(2000);

      let driver = await Driver.create();
      let image = await driver.findComponent(ON.id('drag_image'));
      let dropArea = await driver.findComponent(ON.id('drop_area'));
      await image.dragTo(dropArea);
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GETSUMMARY_ERROR_0003] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC4=401');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0004
     * @tc.name      SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0004
     * @tc.desc      Test OH_ArkUI_DragEvent_GetSummary with fake event pointer returns INTERNAL_ERROR
     * @tc.level     LEVEL0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0004', Level.LEVEL0, async (done: Function) => {
      console.info('[GETSUMMARY_ERROR_0004] START');
      await Utils.sleep(500);
      await Utils.pushPage('dragEventSummary/DragEventSummaryTest');
      await Utils.sleep(2000);

      let driver = await Driver.create();
      let image = await driver.findComponent(ON.id('drag_image'));
      let dropArea = await driver.findComponent(ON.id('drop_area'));
      await image.dragTo(dropArea);
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GETSUMMARY_ERROR_0004] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC5=100001');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0005
     * @tc.name      SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0005
     * @tc.desc      Test OH_ArkUI_DragEvent_GetSummary with fake summary returns PARAM_INVALID
     * @tc.level     LEVEL0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0005', Level.LEVEL0, async (done: Function) => {
      console.info('[GETSUMMARY_ERROR_0005] START');
      await Utils.sleep(500);
      await Utils.pushPage('dragEventSummary/DragEventSummaryTest');
      await Utils.sleep(2000);

      let driver = await Driver.create();
      let image = await driver.findComponent(ON.id('drag_image'));
      let dropArea = await driver.findComponent(ON.id('drop_area'));
      await image.dragTo(dropArea);
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GETSUMMARY_ERROR_0005] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC6=401');
      done();
    })

    /**
     * @tc.number    SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0006
     * @tc.name      SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0006
     * @tc.desc      GetSummary after DestroySummary: runtime returns NO_ERROR (no lifetime check)
     * @tc.level     LEVEL0
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     */
    it('SUB_ACE_ARKUI_DRAGEVENT_GETSUMMARY_ERROR_0006', Level.LEVEL0, async (done: Function) => {
      console.info('[GETSUMMARY_ERROR_0006] START');
      await Utils.sleep(500);
      await Utils.pushPage('dragEventSummary/DragEventSummaryTest');
      await Utils.sleep(2000);

      let driver = await Driver.create();
      let image = await driver.findComponent(ON.id('drag_image'));
      let dropArea = await driver.findComponent(ON.id('drop_area'));
      await image.dragTo(dropArea);
      await Utils.sleep(2000);

      let strJson = getInspectorByKey('result_text');
      let obj: ESObject = JSON.parse(strJson);
      console.info('[GETSUMMARY_ERROR_0006] result: ' + obj.$attrs.content);
      expect(obj.$attrs.content).assertContain('TC7=0');
      done();
    })
  })
}
