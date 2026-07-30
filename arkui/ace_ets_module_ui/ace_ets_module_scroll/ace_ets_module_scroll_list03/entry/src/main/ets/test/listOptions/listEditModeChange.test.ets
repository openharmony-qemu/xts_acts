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

export default function listEditModeChange() {
  describe('listEditModeChange', () => {
    beforeEach(async (done: Function) => {
      console.info("listEditModeChange beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/listOptions/listEditModeChange",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("listEditModeChange" == pages.name)) {
          console.info("get listEditModeChange pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push listEditModeChange page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push listEditModeChange page error:" + err);
      }
      console.info("listEditModeChange beforeEach end");
      done();
    });

    /**
     * @tc.name   listEditModeChange_0100
     * @tc.number SUB_ARKUI_LIST_ONEDITMODECHANGE_PARAM_0100
     * @tc.desc   Test List onEditModeChange property with value true and false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeChange_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[listEditModeChange_0100] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn_true = await driver.findComponent(ON.id('list_enableEditMode_change'));
      await btn_true.click();
      await CommonFunc.sleep(1500);
      let result1: string | undefined = AppStorage.get("list_onEditModeChange");
      console.info('[listEditModeChange_0100] result1: ' + JSON.stringify(result1));
      expect(result1).assertEqual(true);
      await CommonFunc.sleep(500);

      let btn_false = await driver.findComponent(ON.id('list_enableEditMode_change'));
      await btn_false.click();
      await CommonFunc.sleep(1500);
      let result2: string | undefined = AppStorage.get("list_onEditModeChange");
      console.info('[listEditModeChange_0100] result2: ' + JSON.stringify(result2));
      expect(result2).assertEqual(false);
      await CommonFunc.sleep(500);
      AppStorage.delete('list_onEditModeChange')
      console.info('[listEditModeChange_0100] END');
      done();
    });

    /**
     * @tc.name   listEditModeChange_0200
     * @tc.number SUB_ARKUI_LIST_ONEDITMODECHANGE_PARAM_0300
     * @tc.desc   Test List onEditModeChange property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeChange_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[listEditModeChange_0200] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('list_onEditModeChange_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEditModeChange_0200] onEditModeChange: " + JSON.stringify(obj.$attrs.onEditModeChange));
      expect(obj.$attrs.onEditModeChange).assertEqual(undefined);
      console.info('[listEditModeChange_0200] END');
      done();
    });

    /**
     * @tc.name   listEditModeChange_0300
     * @tc.number SUB_ARKUI_LIST_ONEDITMODECHANGE_PARAM_0400
     * @tc.desc   Test List onEditModeChange property with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('listEditModeChange_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[listEditModeChange_0300] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('list_onEditModeChange_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[listEditModeChange_0300] onEditModeChange: " + JSON.stringify(obj.$attrs.onEditModeChange));
      expect(obj.$attrs.onEditModeChange).assertEqual(undefined);
      console.info('[listEditModeChange_0300] END');
      done();
    });
  })
}
