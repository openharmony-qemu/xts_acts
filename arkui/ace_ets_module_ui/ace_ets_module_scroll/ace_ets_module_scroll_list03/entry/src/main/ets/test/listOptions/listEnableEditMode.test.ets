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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function listEnableEditMode() {
  describe('listEnableEditMode', () => {
    beforeEach(async (done: Function) => {
      console.info("listEnableEditMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listOptions/listEnableEditMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("listEnableEditMode" == pages.name)) {
          console.info("get listEnableEditMode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listEnableEditMode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listEnableEditMode page error:" + err);
      }
      console.info("listEnableEditMode beforeEach end");
      done();
    });

    /**
     * @tc.name   listEnableEditMode_0100
     * @tc.number SUB_ARKUI_LIST_ENABLEEDITMODE_PARAM_0100
     * @tc.desc   Test Grid enableEditMode property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableEditMode_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[listEnableEditMode_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('list_enableEditMode_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEnableEditMode_0100] enableEditMode: " + JSON.stringify(obj.$attrs.enableEditMode));
      expect(obj.$attrs.enableEditMode).assertEqual('true');
      console.info('[listEnableEditMode_0100] END');
      done();
    });

    /**
     * @tc.name   listEnableEditMode_0200
     * @tc.number SUB_ARKUI_LIST_ENABLEEDITMODE_PARAM_0200
     * @tc.desc   Test Grid enableEditMode property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableEditMode_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[listEnableEditMode_0200] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('list_enableEditMode_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEnableEditMode_0200] enableEditMode: " + JSON.stringify(obj.$attrs.enableEditMode));
      expect(obj.$attrs.enableEditMode).assertEqual('false');
      console.info('[listEnableEditMode_0200] END');
      done();
    });

    /**
     * @tc.name   listEnableEditMode_0300
     * @tc.number SUB_ARKUI_LIST_ENABLEEDITMODE_PARAM_0300
     * @tc.desc   Test Grid enableEditMode property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableEditMode_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[listEnableEditMode_0300] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('list_enableEditMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEnableEditMode_0300] enableEditMode: " + JSON.stringify(obj.$attrs.enableEditMode));
      expect(obj.$attrs.enableEditMode).assertEqual('false');
      console.info('[listEnableEditMode_0300] END');
      done();
    });

    /**
     * @tc.name   listEnableEditMode_0400
     * @tc.number SUB_ARKUI_LIST_ENABLEEDITMODE_PARAM_0400
     * @tc.desc   Test Grid enableEditMode property with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEnableEditMode_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[listEnableEditMode_0400] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('list_enableEditMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEnableEditMode_0400] enableEditMode: " + JSON.stringify(obj.$attrs.enableEditMode));
      expect(obj.$attrs.enableEditMode).assertEqual('false');
      console.info('[listEnableEditMode_0400] END');
      done();
    });
  })
}
