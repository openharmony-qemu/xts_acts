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
import { vp2px } from '@ohos.arkui.component';
import { AttrsManager, EN } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign, AlignRuleParam, Color, $r } from '@ohos.arkui.component';
import { jsonx } from "std/core";
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// class PageConfig {
//   testName: string = '';
//   pageName: string = '';
//   pageUrl: string = '';
//   parentBackGroundColor: Color = Color.White;
//   parentComponentKey: string = '';
//   parentHeight: number = 0;
//   parentWidth: number = 0;
//   referenceComponentKey: string = '';
// }
//
// class TestValues {
//   describe: string = '';
//   setValue: jsonx.JsonElement;
//   expectValue: jsonx.JsonElement;
// }

export default function paddingTest() {
  //A list of components that support padding attributes is required.
  let supportView: Array<string> = new Array<string>(
    'Badge',
    'Column',
    //    'Counter',
    'GridRow',
    'Grid',
    'List',
    //    'Panel',
    'Refresh',
    'Row',
    'Scroll',
    //    'SideBarContainer',
    'Stack',
    'Swiper',
    //    'Tabs',
    'TabContent',
    'Flex',
    'GridCol',
    'GridItem',
    'ListItemGroup',
    'Navigator',
    //    'RelativeContainer',
  //    'ListItem'
  )

  //The size of the parent component, when set as a percentage, serves as the calculation.
  let parentWidth = 400;
  let parentHeight = 400;
  //Called from the parent class when setting the background color.
  let parentBackGroundColor = Color.Yellow

  //Page related configuration, this parameter is required.
  let pageConfig: PageConfig = {
    testName: 'testPaddingContainerLength',
    pageName: 'PaddingContainerPageLength',
    pageUrl: 'MainAbility/pages/padding/PaddingContainerPageLength',
    parentBackGroundColor: parentBackGroundColor,
    parentComponentKey: 'parentComponentKey',
    parentHeight: parentHeight,
    parentWidth: parentWidth,
    referenceComponentKey: 'referenceComponentKey'
  }

  //The data type to be tested, this parameter is required.
  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      padding: 10
    },
    expectValue: {
      padding: '10.00vp',
      // top: vp2px(10),
      // right: vp2px(10),
      // bottom: vp2px(10),
      // left: vp2px(10)
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      padding: '100px'
    },
    expectValue: {
      padding: '100.00px',
      top: 100,
      right: 100,
      bottom: 100,
      left: 100
    }
  }, {
    describe: 'SetResource',
    setValue: {
      padding: $r('app.float.10vp'),
    },
    expectValue: {
      padding: '10.00vp',
      // top: vp2px(10),
      // right: vp2px(10),
      // bottom: vp2px(10),
      // left: vp2px(10)
    }
  }, {
    describe: 'SetStringPercent',
    setValue: {
      padding: '10%',
    },
    expectValue: {
      padding: '10.00%',
      // parentWidthAfter: vp2px(parentWidth) * 0.1
    }
  }] as TestValue[]

  /**
   * Create test suite.
   */
  describe('PaddingContainerLengthTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    //Generate test cases (it) through a loop based on the support view * test values.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Modify the reference component properties.
      AttrsManager.change(data.caseTag, {
        padding: 0
      } as EN);
      await Utils.sleep(1000);

      //Obtain dimensional information for target components.
      let targetRectBefore: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);

      //Verify the width size of the target component.
      let targetRectBeforeWidth = targetRectBefore.right - targetRectBefore.left;

      console.info('[' + data.caseTag + '] targetRectBeforeWidth:' + targetRectBeforeWidth);

      //Verify the height size of the reference component.
      let targetRectBeforeHeight = targetRectBefore.bottom - targetRectBefore.top;

      console.info('[' + data.caseTag + '] targetRectBeforeHeight:' + targetRectBeforeHeight);

      //Modify the target component properties.
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let targetRectAfter: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);

      //Confirm that the size attribute values have been successfully set.
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(viewObj.getElement('$attrs').getString('padding')).assertEqual(data.testValue.expectValue.padding);

      //Verification method for special reference components.
      if (data.pageConfig.componentKey == 'RelativeContainer' || data.pageConfig.componentKey == 'RowSplit'
        || data.pageConfig.componentKey == 'ListItemGroup' || data.pageConfig.componentKey == 'List'
        || data.pageConfig.componentKey == 'ColumnSplit' || data.pageConfig.componentKey == 'Flex'
        || data.pageConfig.componentKey == 'GridCol' || data.pageConfig.componentKey == 'FlowItem'
        || data.pageConfig.componentKey == 'GridRow' || data.pageConfig.componentKey == 'Panel'
        || data.pageConfig.componentKey == 'SideBarContainer' || data.pageConfig.componentKey == 'TabContent'
        || data.pageConfig.componentKey == 'WaterFlow' /*||data.pageConfig.componentKey == 'ListItem'*/
      ) {
        //Obtain the size information of the reference component.
        let referenceRect: RectValue = Utils.getComponentRect(data.pageConfig.referenceComponentKey);

        //Verification method for special components.
        if (data.testValue.describe == 'SetNumber' || data.testValue.describe == 'SetResource'
          || data.testValue.describe == 'SetStringPx') {
          console.info('[' + data.caseTag + ']referenceRect.top - targetRectAfter.top:'
            + (referenceRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
            + (referenceRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
            + (targetRectAfter.bottom - referenceRect.bottom));
          console.info('[' + data.caseTag + ']targetRectAfter.right - referenceRect.right:'
            + (targetRectAfter.right - referenceRect.right));

          //Panel component need special adapter ,the reason is the top of Panel has a own size
          if (data.pageConfig.componentKey == 'Panel') {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.bottom + vp2px(8))) <= 1)
              .assertTrue();
          } else {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.top)) <= 1)
              .assertTrue();
          }
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right) <= 1)
            .assertTrue();
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left) <= 1)
            .assertTrue();

        } else if (data.testValue.describe == 'SetStringPercent') {
          console.info('[' + data.caseTag + ']referenceRect.top - targetRectAfter.top:'
            + (referenceRect.top - targetRectAfter.top));
          console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
            + (referenceRect.left - targetRectAfter.left));
          console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
            + (targetRectAfter.bottom - referenceRect.bottom));
          console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
            + (targetRectAfter.right - referenceRect.right));

          //Panel component need special adapter ,the reason is the top of Panel has a own size
          if (data.pageConfig.componentKey == 'Panel') {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - (data.testValue.expectValue.parentWidthAfter + vp2px(8))) <= 1)
              .assertTrue();
          } else {
            expect(Math.abs(referenceRect.top - targetRectAfter.top - data.testValue.expectValue.parentWidthAfter) <= 1)
              .assertTrue();
          }
          expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.parentWidthAfter) <= 1)
            .assertTrue();
          expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.parentWidthAfter) <= 1)
            .assertTrue();
          expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.parentWidthAfter) <= 1)
            .assertTrue();
        }
      } else if (data.pageConfig.componentKey == 'Tabs') {
        // let referenceRect: RectValue = Utils.getComponentRectByObj(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        //   .$children[0]
        //   .$children[0]
        //   .$children[1]);
        // let rectTabBar: RectValue = Utils.getComponentRectByObj(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        //   .$children[0]
        //   .$children[0]
        //   .$children[0]);
        // console.info('rectTabBar.bottom - rectTabBar.top:')
        // if (data.testValue.describe == 'SetNumber' || data.testValue.describe == 'SetStringPx'
        //   || data.testValue.describe == 'SetResource') {
        //   console.info('[' + data.caseTag + '] referenceRect.top - targetRectAfter.top:'
        //     + (referenceRect.top - targetRectAfter.top));
        //   console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
        //     + (referenceRect.left - targetRectAfter.left));
        //   console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
        //     + (targetRectAfter.bottom - referenceRect.bottom));
        //   console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
        //     + (targetRectAfter.right - referenceRect.right));
        //   expect(Math.abs(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top) - data.testValue.expectValue.top) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.bottom) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.right) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.left) <= 1)
        //     .assertTrue();
        // } else if (data.testValue.describe == 'SetStringPercent') {
        //   console.info('[' + data.caseTag + '] referenceRect.top - targetRectAfter.top:'
        //     + (referenceRect.top - targetRectAfter.top));
        //   console.info('[' + data.caseTag + '] referenceRect.left - targetRectAfter.left:'
        //     + (referenceRect.left - targetRectAfter.left));
        //   console.info('[' + data.caseTag + '] targetRectAfter.bottom - referenceRect.bottom:'
        //     + (targetRectAfter.bottom - referenceRect.bottom));
        //   console.info('[' + data.caseTag + '] targetRectAfter.right - referenceRect.right:'
        //     + (targetRectAfter.right - referenceRect.right));
        //
        //   expect(Math.abs(referenceRect.top - targetRectAfter.top - (rectTabBar.bottom - rectTabBar.top) - data.testValue.expectValue.parentWidthAfter) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.bottom - referenceRect.bottom - data.testValue.expectValue.parentWidthAfter))
        //     .assertTrue();
        //   expect(Math.abs(targetRectAfter.right - referenceRect.right - data.testValue.expectValue.parentWidthAfter) <= 1)
        //     .assertTrue();
        //   expect(Math.abs(referenceRect.left - targetRectAfter.left - data.testValue.expectValue.parentWidthAfter) <= 1)
        //     .assertTrue();
        // }
      } else {
        //Verify the width size of the target component.
        let targetRectAfterWidth = targetRectAfter.right - targetRectAfter.left;
        console.info('[' + data.caseTag + '] targetRectAfterWidth:' + targetRectAfterWidth);

        //Verify the height size of the target component.
        let targetRectAfterHeight = targetRectAfter.bottom - targetRectAfter.top;

        console.info('[' + data.caseTag + '] targetRectAfterHeight:' + targetRectAfterHeight);
        console.info('[' + data.caseTag + '] targetRectAfterWidth:' + targetRectAfterWidth);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.left:' + data.testValue.expectValue.left);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.right:' + data.testValue.expectValue.right);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.top:' + data.testValue.expectValue.top);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.bottom:' + data.testValue.expectValue.bottom);
        console.info('[' + data.caseTag + '] data.testValue.expectValue.parentWidthAfter:' + data.testValue.expectValue.parentWidthAfter);

        if (data.testValue.describe == 'SetStringPercent') {
          expect(Math.floor(Math.abs(targetRectAfterWidth - targetRectBeforeWidth - ((data.testValue.expectValue.parentWidthAfter) * 2))) <= 1)
            .assertTrue();
          expect(Math.floor(Math.abs(targetRectAfterHeight - targetRectBeforeHeight - ((data.testValue.expectValue.parentWidthAfter) * 2))) <= 1)
            .assertTrue();
        } else {
          //Verify if other methods were successful.
          expect(Math.floor(Math.abs(targetRectAfterWidth - targetRectBeforeWidth - (data.testValue.expectValue.left + data.testValue.expectValue.right))) <= 1)
            .assertTrue();
          expect(Math.floor(Math.abs(targetRectAfterHeight - targetRectBeforeHeight - (data.testValue.expectValue.top + data.testValue.expectValue.bottom))) <= 1)
            .assertTrue();
        }
      }
    })
  })
}