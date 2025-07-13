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
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, ExpectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import CommonTest from "../common/CommonTest"
import { describe, beforeAll, expect } from "../../../../hypium/index"
import { focusControl, $r } from '@ohos.arkui.component'
import { Color } from '@ohos.arkui.component';
import { UIContext } from "@ohos.arkui.UIContext";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();

/**
 * Test of common attribute: size
 */
export default function sizeTest() {
  //A list of components that support size attributes is required.
  let supportView: Array<string> = new Array<string>(
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow',
    'Stepper',
    'FlowItem'
  )

  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 300;
  let parentHeight = 300;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Red;
  let BackGroundColor = Color.Orange;

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testSize',
    pageName: 'SizePage',
    pageUrl: 'MainAbility/pages/size/SizePage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentBackGroundColor: parentBackGroundColor,
    BackGroundColor: BackGroundColor
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
  //   describe: 'StringNumber',
  //   setValue: {
  //     width: 200, height: 200
  //   },
  //   expectValue: {
  //     widthCompare: '200.00vp', heightCompare: '200.00vp',
  //     width: uiContext.vp2px(200), height: uiContext.vp2px(200)
  //   } as ExpectValue
  // }, {
  //   describe: 'StringPercent',
  //   setValue: {
  //     width: '50%', height: '50%'
  //   },
  //   expectValue: {
  //     widthCompare: '50.00%', heightCompare: '50.00%',
  //     width: uiContext.vp2px(parentWidth) * 0.5, height: uiContext.vp2px(parentHeight) * 0.5
  //   } as ExpectValue
  // }, {
  //   describe: 'Resource',
  //   setValue: {
  //     width: $r('app.float.200vp'),
  //     height: $r('app.float.100vp')
  //   },
  //   expectValue: {
  //     widthCompare: '200.00vp', heightCompare: '100.00vp',
  //     width: uiContext.vp2px(200),
  //     height: uiContext.vp2px(100)
  //   } as ExpectValue
  // }, {
  //   describe: 'StringPx',
  //   setValue: {
  //     width: '300px',
  //     height: '300px'
  //   },
  //   expectValue: {
  //     widthCompare: '300.00px', heightCompare: '300.00px',
  //     width: 300, height: 300
  //   } as ExpectValue
  // }, {
  //   describe: 'SetStringWidth',
  //   setValue: {
  //     width: '300px'
  //   },
  //   expectValue: {
  //     widthCompare: '300.00px',
  //     width: 300
  //   } as ExpectValue
  // },
  //   {
  //     describe: 'SetStringHeight',
  //     setValue: {
  //       height: '300px'
  //     },
  //     expectValue: {
  //       heightCompare: '300.00px',
  //       height: 300
  //     } as ExpectValue
    }]

  /**
   * Create test suite.
   */
  describe('SizeTest', () => {
    beforeAll(() => {
      console.info("SizeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.size.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues,
      async (data: BasePageConfig): Promise<void> => {

      //Obtain dimensional information for reference components.
      let rect: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verify the width size of the target component.
      let strJsonRectWidth = rect.right - rect.left;

      //Verify the height size of the target component.
      let strJsonRectHeight = rect.bottom - rect.top;

      console.info('[' + data.caseTag + '] strJsonRectWidth is: ' + strJsonRectWidth);
      console.info('[' + data.caseTag + '] strJsonRectHeight is: ' + strJsonRectHeight);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.width:' + data.testValue.expectValue?.width);
      console.info('[' + data.caseTag + '] data.testValue.expectValue.height:' + data.testValue.expectValue?.height);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.size.width:' + data.viewObj?.size?.['width']);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.size.height:' + data.viewObj?.size?.['height']);

      if (data.testValue.describe == 'SetStringWidth') {
        //When the use case is SetStringWidth.
        //Assertion width is consistent with expected value.
        expect(data.viewObj?.size?.['width']).assertEqual(data.testValue.expectValue?.widthCompare);
        expect(Math.abs(Math.round(strJsonRectWidth) - Math.round(data.testValue.expectValue?.width as number)) <= 2).assertTrue();
      } else if (data.testValue.describe == 'SetStringHeight') {
        //When the use case is SetStringHeight.
        //Assertion height is consistent with expected value.
        expect(data.viewObj?.size?.['height']).assertEqual(data.testValue.expectValue?.heightCompare);
        expect(Math.abs(Math.round(strJsonRectHeight) - Math.round(data.testValue.expectValue?.height as number)) <= 2).assertTrue();
      } else {
        //Confirm that the size attribute values have been successfully set.
        expect(data.viewObj?.size?.['width']).assertEqual(data.testValue.expectValue?.widthCompare);
        expect(data.viewObj?.size?.['height']).assertEqual(data.testValue.expectValue?.heightCompare);

        //Confirm that the calculated value is consistent with the expected value.
        expect(Math.abs(Math.round(strJsonRectWidth) - Math.round(data.testValue.expectValue?.width as number)) <= 2).assertTrue()
        expect(Math.abs(Math.round(strJsonRectHeight) - Math.round(data.testValue.expectValue?.height as number)) <= 2).assertTrue()
      }
    })
  })
}
