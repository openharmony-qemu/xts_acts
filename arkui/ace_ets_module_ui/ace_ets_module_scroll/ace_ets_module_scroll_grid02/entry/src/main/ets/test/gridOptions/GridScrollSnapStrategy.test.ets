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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gridScrollSnapStrategy() {
  describe('gridScrollSnapStrategy', () => {
    beforeEach(async (done: Function) => {
      console.info("GridScrollSnapStrategy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridOptions/GridScrollSnapStrategy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("GridScrollSnapStrategy" == pages.name)) {
          console.info("get GridScrollSnapStrategy pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push GridScrollSnapStrategy page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GridScrollSnapStrategy page error:" + err);
      }
      console.info("GridScrollSnapStrategy beforeEach end");
      done();
    });

    /**
     * @tc.name   gridScrollSnapStrategy_0100
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_PARAM_0100
     * @tc.desc   Test Grid scrollSnapStrategy property with ScrollSnapAlign.START
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollSnapStrategy_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridScrollSnapStrategy_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridScrollSnapStrategy_0100] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy).assertEqual('ScrollSnapAlign.START');
      console.info('[gridScrollSnapStrategy_0100] END');
      done();
    });

    /**
     * @tc.name   gridScrollSnapStrategy_0200
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_PARAM_0200
     * @tc.desc   Test Grid scrollSnapStrategy property with ScrollSnapAlign.CENTER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollSnapStrategy_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[gridScrollSnapStrategy_0200] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_center');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridScrollSnapStrategy_0200] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy).assertEqual('ScrollSnapAlign.CENTER');
      console.info('[gridScrollSnapStrategy_0200] END');
      done();
    });

    /**
     * @tc.name   gridScrollSnapStrategy_0300
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_PARAM_0300
     * @tc.desc   Test Grid scrollSnapStrategy property with ScrollSnapAlign.END
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollSnapStrategy_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[gridScrollSnapStrategy_0300] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_end');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridScrollSnapStrategy_0300] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy).assertEqual('ScrollSnapAlign.END');
      console.info('[gridScrollSnapStrategy_0300] END');
      done();
    });

    /**
     * @tc.name   gridScrollSnapStrategy_0400
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_PARAM_0400
     * @tc.desc   Test Grid scrollSnapStrategy property with ScrollSnapAlign.NONE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollSnapStrategy_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[gridScrollSnapStrategy_0400] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_none');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridScrollSnapStrategy_0400] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy).assertEqual('ScrollSnapAlign.NONE');
      console.info('[gridScrollSnapStrategy_0400] END');
      done();
    });

    /**
     * @tc.name   gridScrollSnapStrategy_0500
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_PARAM_0500
     * @tc.desc   Test Grid scrollSnapStrategy property with undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollSnapStrategy_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[gridScrollSnapStrategy_0500] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridScrollSnapStrategy_0500] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy).assertEqual('ScrollSnapAlign.NONE');
      console.info('[gridScrollSnapStrategy_0500] END');
      done();
    });

    /**
     * @tc.name   gridScrollSnapStrategy_0600
     * @tc.number SUB_ARKUI_GRID_SCROLLSNAPSTRATEGY_PARAM_0600
     * @tc.desc   Test Grid scrollSnapStrategy property with null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridScrollSnapStrategy_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[gridScrollSnapStrategy_0600] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_snapStrategy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridScrollSnapStrategy_0600] scrollSnapStrategy: " +
        JSON.stringify(obj.$attrs.scrollSnapStrategy));
      expect(obj.$attrs.scrollSnapStrategy).assertEqual('ScrollSnapAlign.NONE');
      console.info('[gridScrollSnapStrategy_0600] END');
      done();
    });
  })
}
