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

export default function gridEditModeOptions() {
  describe('gridEditModeOptions', () => {
    beforeEach(async (done: Function) => {
      console.info("gridEditModeOptions beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/gridOptions/gridEditModeOptions",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get   state pages:" + JSON.stringify(pages));
        if (!("gridEditModeOptions" == pages.name)) {
          console.info("get gridEditModeOptions pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push gridEditModeOptions page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push gridEditModeOptions page error:" + err);
      }
      console.info("gridEditModeOptions beforeEach end");
      done();
    });

    /**
     * @tc.name   gridUseDefaultMultiSelectStyle_0100
     * @tc.number SUB_ARKUI_GRID_USEDEFAULTMULTISELECTSTYLE_PARAM_0100
     * @tc.desc   Test Grid editModeOptions useDefaultMultiSelectStyle property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridUseDefaultMultiSelectStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridUseDefaultMultiSelectStyle_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_useDefaultMultiSelectStyle_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridUseDefaultMultiSelectStyle_0100] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.useDefaultMultiSelectStyle).assertEqual('true');
      console.info('[gridUseDefaultMultiSelectStyle_0100] END');
      done();
    });

    /**
     * @tc.name   gridUseDefaultMultiSelectStyle_0200
     * @tc.number SUB_ARKUI_GRID_USEDEFAULTMULTISELECTSTYLE_PARAM_0200
     * @tc.desc   Test Grid editModeOptions useDefaultMultiSelectStyle property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridUseDefaultMultiSelectStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[gridUseDefaultMultiSelectStyle_0200] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_useDefaultMultiSelectStyle_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridUseDefaultMultiSelectStyle_0200] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.useDefaultMultiSelectStyle).assertEqual('false');
      console.info('[gridUseDefaultMultiSelectStyle_0200] END');
      done();
    });

    /**
     * @tc.name   gridUseDefaultMultiSelectStyle_0300
     * @tc.number SUB_ARKUI_GRID_USEDEFAULTMULTISELECTSTYLE_PARAM_0300
     * @tc.desc   Test Grid editModeOptions useDefaultMultiSelectStyle property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridUseDefaultMultiSelectStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[gridUseDefaultMultiSelectStyle_0300] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_useDefaultMultiSelectStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridUseDefaultMultiSelectStyle_0400] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.useDefaultMultiSelectStyle).assertEqual('true');
      console.info('[gridUseDefaultMultiSelectStyle_0300] END');
      done();
    });

    /**
     * @tc.name   gridUseDefaultMultiSelectStyle_0400
     * @tc.number SUB_ARKUI_GRID_USEDEFAULTMULTISELECTSTYLE_PARAM_0400
     * @tc.desc   Test Grid editModeOptions useDefaultMultiSelectStyle property with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridUseDefaultMultiSelectStyle_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[gridUseDefaultMultiSelectStyle_0400] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_useDefaultMultiSelectStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridUseDefaultMultiSelectStyle_0400] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.useDefaultMultiSelectStyle).assertEqual('true');
      console.info('[gridUseDefaultMultiSelectStyle_0400] END');
      done();
    });

    /**
     * @tc.name   gridEnableGatherSelectedItemsAnimation_0100
     * @tc.number SUB_ARKUI_GRID_ENABLEGATHERSELECTEDITEMSANIMATION_PARAM_0100
     * @tc.desc   Test Grid editModeOptions enableGatherSelectedItemsAnimation property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableGatherSelectedItemsAnimation_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableGatherSelectedItemsAnimation_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableGatherSelectedItemsAnimation_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableGatherSelectedItemsAnimation_0100] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation).assertEqual('true');
      console.info('[gridEnableGatherSelectedItemsAnimation_0100] END');
      done();
    });

    /**
     * @tc.name   gridEnableGatherSelectedItemsAnimation_0200
     * @tc.number SUB_ARKUI_GRID_ENABLEGATHERSELECTEDITEMSANIMATION_PARAM_0200
     * @tc.desc   Test Grid editModeOptions enableGatherSelectedItemsAnimation property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableGatherSelectedItemsAnimation_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableGatherSelectedItemsAnimation_0200] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableGatherSelectedItemsAnimation_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableGatherSelectedItemsAnimation_0200] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation).assertEqual('false');
      console.info('[gridEnableGatherSelectedItemsAnimation_0200] END');
      done();
    });

    /**
     * @tc.name   gridEnableGatherSelectedItemsAnimation_0300
     * @tc.number SUB_ARKUI_GRID_ENABLEGATHERSELECTEDITEMSANIMATION_PARAM_0300
     * @tc.desc   Test Grid editModeOptions enableGatherSelectedItemsAnimation property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableGatherSelectedItemsAnimation_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableGatherSelectedItemsAnimation_0300] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableGatherSelectedItemsAnimation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableGatherSelectedItemsAnimation_0300] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation).assertEqual('false');
      console.info('[gridEnableGatherSelectedItemsAnimation_0300] END');
      done();
    });

    /**
     * @tc.name   gridEnableGatherSelectedItemsAnimation_0400
     * @tc.number SUB_ARKUI_GRID_ENABLEGATHERSELECTEDITEMSANIMATION_PARAM_0400
     * @tc.desc   Test Grid editModeOptions enableGatherSelectedItemsAnimation property with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableGatherSelectedItemsAnimation_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableGatherSelectedItemsAnimation_0400] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableGatherSelectedItemsAnimation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableGatherSelectedItemsAnimation_0400] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation).assertEqual('false');
      console.info('[gridEnableGatherSelectedItemsAnimation_0400] END');
      done();
    });

    /**
     * @tc.name   gridEnableFingerMultiSelect_0100
     * @tc.number SUB_ARKUI_grid_enableTwoFingerMultiSelect_PARAM_0100
     * @tc.desc   Test Grid editModeOptions enableFingerMultiSelect property with value true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableFingerMultiSelect_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableFingerMultiSelect_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableTwoFingerMultiSelect_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableFingerMultiSelect_0100] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableFingerMultiSelect).assertEqual('true');
      console.info('[gridEnableFingerMultiSelect_0100] END');
      done();
    });

    /**
     * @tc.name   gridEnableFingerMultiSelect_0200
     * @tc.number SUB_ARKUI_grid_enableTwoFingerMultiSelect_PARAM_0200
     * @tc.desc   Test Grid editModeOptions enableFingerMultiSelect property with value false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableFingerMultiSelect_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableFingerMultiSelect_0200] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableTwoFingerMultiSelect_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableFingerMultiSelect_0200] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableFingerMultiSelect).assertEqual('false');
      console.info('[gridEnableFingerMultiSelect_0200] END');
      done();
    });

    /**
     * @tc.name   gridEnableFingerMultiSelect_0300
     * @tc.number SUB_ARKUI_grid_enableTwoFingerMultiSelect_PARAM_0300
     * @tc.desc   Test Grid editModeOptions enableFingerMultiSelect property with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableFingerMultiSelect_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableFingerMultiSelect_0300] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableTwoFingerMultiSelect_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableFingerMultiSelect_0300] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableFingerMultiSelect).assertEqual('true');
      console.info('[gridEnableFingerMultiSelect_0300] END');
      done();
    });

    /**
     * @tc.name   gridEnableFingerMultiSelect_0400
     * @tc.number SUB_ARKUI_grid_enableTwoFingerMultiSelect_PARAM_0400
     * @tc.desc   Test Grid editModeOptions enableFingerMultiSelect property with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEnableFingerMultiSelect_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEnableFingerMultiSelect_0400] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_enableTwoFingerMultiSelect_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEnableFingerMultiSelect_0400] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.enableFingerMultiSelect).assertEqual('true');
      console.info('[gridEnableFingerMultiSelect_0400] END');
      done();
    });

    /**
     * @tc.name   gridEditModeOptionsNull_0100
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_NULL_PARAM_0100
     * @tc.desc   Test Grid editModeOptions parameter with value null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptionsNull_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEditModeOptionsNull_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_editModeOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEditModeOptionsNull_0100] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.useDefaultMultiSelectStyle).assertEqual('true');
      expect(obj.$attrs.editModeOptions.enableFingerMultiSelect).assertEqual('true');
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation).assertEqual('false');
      console.info('[gridEditModeOptionsNull_0100] END');
      done();
    });

    /**
     * @tc.name   gridEditModeOptionsUndefined_0100
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_UNDEFINED_PARAM_0100
     * @tc.desc   Test Grid editModeOptions parameter with value undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptionsUndefined_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEditModeOptionsUndefined_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_editModeOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEditModeOptionsUndefined_0100] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.useDefaultMultiSelectStyle).assertEqual('true');
      expect(obj.$attrs.editModeOptions.enableFingerMultiSelect).assertEqual('true');
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation).assertEqual('false');
      console.info('[gridEditModeOptionsUndefined_0100] END');
      done();
    });

    /**
     * @tc.name   gridEditModeOptionsMultiProperties_0100
     * @tc.number SUB_ARKUI_GRID_EDITMODEOPTIONS_MULTIPROPERTIES_PARAM_0100
     * @tc.desc   Test Grid editModeOptions with multiple properties
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('gridEditModeOptionsMultiProperties_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gridEditModeOptionsMultiProperties_0100] START');
      await CommonFunc.sleep(500);
      let strJson: string = getInspectorByKey('grid_editModeOptions_multiProperties');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[gridEditModeOptionsMultiProperties_0100] editModeOptions: " +
        JSON.stringify(obj.$attrs.editModeOptions));
      expect(obj.$attrs.editModeOptions.useDefaultMultiSelectStyle).assertEqual('true');
      expect(obj.$attrs.editModeOptions.enableGatherSelectedItemsAnimation).assertEqual('true');
      expect(obj.$attrs.editModeOptions.enableFingerMultiSelect).assertEqual('true');
      console.info('[gridEditModeOptionsMultiProperties_0100] END');
      done();
    });
  });
}