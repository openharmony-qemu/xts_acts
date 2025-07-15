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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, DisplayValue, Attrs } from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll  } from '../../../../hypium/index'
import {  ItemAlign, VerticalAlign, HorizontalAlign } from '@ohos.arkui.component'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function displayPriorityTest() {

  let containerView: Array<string> = new Array<string>('Row', 'Column', 'Flex')

  //Component to be tested
  let supportView: Array<string> = new Array<string>(
    'AlphabetIndexer',
    'Blank',
    'Button',
    'Checkbox',
    'CheckboxGroup',
    'DataPanel',
    'DatePicker',
    'Divider',
    'Gauge',
    'Image',
    'ImageAnimator',
    'LoadingProgress',
    'Marquee',
    'Menu',
    //'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    //'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'Counter',
    //'Flex',
    'GridRow',
    'Grid',
    'List',
    'Navigator',
    //'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape'
  )

  //Custom params.
  let targetWidth = 120;
  let targetHeight = 120;
  let compareOneButtonWidth = 120;
  let compareOneButtonHeight = 120;
  let compareOneButtonKey = 'compareOneButtonKey';
  let compareTwoButtonWidth = 120;
  let compareTwoButtonHeight = 120;
  let compareTwoButtonDisplayPriority = 3.0;
  let compareTwoButtonKey = 'compareTwoButtonKey';
  let parentWidth = 300;
  let parentHeight = 300;
  let parentKey = 'parentKey';

  let pageConfig: PageConfig = {
    testName: 'testDisplayPriority',
    pageName: 'DisplayPriorityPage',
    pageUrl: 'MainAbility/pages/displayPriority/DisplayPriorityPage',
    targetGroupView: 'targetGroupView',
    targetWidth: targetWidth,
    targetHeight: targetHeight,
    compareOneButtonWidth: compareOneButtonWidth,
    compareOneButtonHeight: compareOneButtonHeight,
    compareOneButtonKey: compareOneButtonKey,
    compareTwoButtonWidth: compareTwoButtonWidth,
    compareTwoButtonHeight: compareTwoButtonHeight,
    compareTwoButtonDisplayPriority: compareTwoButtonDisplayPriority,
    compareTwoButtonKey: compareTwoButtonKey,
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentKey: parentKey
  }

  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'LowPriorityIsHidden',
    setValue: {
      displayPriority: 4.0
    },
    expectValue: {
      displayPriority: 4.0
    }
  },
    //    {
    //    describe: 'SetDecimal',
    //    setValue: {
    //      displayPriority: 2.9,
    //    },
    //    expectValue: {
    //      displayPriority: 2.0
    //    }
    //  },
    {
      describe: 'SetPriority',
      setValue: {
        displayPriority: 0.9,
        compareOneButtonDisplayPriority: 0.0
      },
      expectValue: {
        displayPriority: 0.0,
        compareOneButtonDisplayPriority: 0.0
      }
    }]

  describe('DisplayPriorityTest', () => {
    beforeAll(() => {
      console.info("displayPriorityTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.displayPriority.test", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTestByContainerView(pageConfig, containerView, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      const uiContext = new UIContext();
      let targetRect = Utils.getComponentRect(data.pageConfig.componentKey!);
      let parentRect = Utils.getComponentRect(data.pageConfig.parentKey!);
      let compareTwoButtonRect = Utils.getComponentRect(data.pageConfig.compareTwoButtonKey!);
      if ((data.pageConfig.containerView == 'Row') || (data.pageConfig.containerView == 'Flex')) {
        //When the parent container is Row or Flex
        if (data.testValue.describe == 'LowPriorityIsHidden') {
          //Check whether the position of the reference component is correct
          console.info('[' + data.caseTag + '] data.testValue.describe is:' + data.testValue.describe);
          console.info('[' + data.caseTag + '] displayPriority is:' + data.viewObj!.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] parentRect.left is:' + parentRect.left);
          console.info('[' + data.caseTag + '] targetRect.left is:' + targetRect.left);
          console.info('[' + data.caseTag + '] targetRect.right is:' + targetRect.right);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.left is:' + compareTwoButtonRect.left);
          expect(data.viewObj!.$attrs.displayPriority).assertEqual(data.testValue.expectValue.displayPriority);
          expect(targetRect.left).assertEqual(parentRect.left);
          expect(targetRect.right).assertEqual(compareTwoButtonRect.left);
        } else if (data.testValue.describe == 'SetDecimal') {
          //Check whether the position of the reference component is correct
          console.info('[' + data.caseTag + '] data.testValue.describe is:' + data.testValue.describe);
          console.info('[' + data.caseTag + '] displayPriority is:' + data.viewObj!.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] parentRect.left is:' + parentRect.left);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.left is:' + compareTwoButtonRect.left);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.right is:' + compareTwoButtonRect.right);
          expect(data.viewObj!.$attrs.displayPriority).assertEqual(data.testValue.expectValue.displayPriority);
          expect(compareTwoButtonRect.left).assertEqual(parentRect.left);
          // expect(Math.abs((compareTwoButtonRect.right - compareTwoButtonRect.left)- uiContext.vp2px(compareTwoButtonWidth)) <= 1).assertTrue();
        } else if (data.testValue.describe == 'SetPriority') {
          //Check whether the position of the reference component is correct
          let compareOneButtonComponent: Attrs = Utils.getComponentByKey(data.pageConfig.compareOneButtonKey!);
          console.info('[' + data.caseTag + '] data.testValue.describe is:' + data.testValue.describe);
          console.info('[' + data.caseTag + '] displayPriority is:' + data.viewObj!.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] compareOneButton displayPriority is:'
            + compareOneButtonComponent.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] parentRect.left is:' + parentRect.left);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.left is:' + compareTwoButtonRect.left);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.right is:' + compareTwoButtonRect.right);
          expect(data.viewObj!.$attrs.displayPriority).assertEqual(data.testValue.expectValue.displayPriority);
          expect(compareOneButtonComponent.$attrs.displayPriority)
            .assertEqual(data.testValue.expectValue.compareOneButtonDisplayPriority);
          expect(compareTwoButtonRect.left).assertEqual(parentRect.left);
          // expect(Math.abs((compareTwoButtonRect.right - compareTwoButtonRect.left)- uiContext.vp2px(compareTwoButtonWidth)) <= 1).assertTrue();
        } else {
          console.info('[' + data.caseTag + '] data.testValue.describe is error:' + data.testValue.describe);
        }
      } else if (data.pageConfig.containerView == 'Column') {
        //When the parent container is Column
        if (data.testValue.describe == 'LowPriorityIsHidden') {
          //Check whether the position of the reference component is correct
          console.info('[' + data.caseTag + '] data.testValue.describe is:' + data.testValue.describe);
          console.info('[' + data.caseTag + '] displayPriority is:' + data.viewObj!.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] parentRect.top is:' + parentRect.top);
          console.info('[' + data.caseTag + '] targetRect.top is:' + targetRect.top);
          console.info('[' + data.caseTag + '] targetRect.bottom is:' + targetRect.bottom);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.top is:' + compareTwoButtonRect.top);
          expect(data.viewObj!.$attrs.displayPriority).assertEqual(data.testValue.expectValue.displayPriority);
          expect(targetRect.top).assertEqual(parentRect.top);
          expect(targetRect.bottom).assertEqual(compareTwoButtonRect.top);
        } else if (data.testValue.describe == 'SetDecimal') {
          //Check whether the position of the reference component is correct
          console.info('[' + data.caseTag + '] data.testValue.describe is:' + data.testValue.describe);
          console.info('[' + data.caseTag + '] displayPriority is:' + data.viewObj!.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] parentRect.top is:' + parentRect.top);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.top is:' + compareTwoButtonRect.top);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.bottom is:' + compareTwoButtonRect.bottom);
          expect(data.viewObj!.$attrs.displayPriority).assertEqual(data.testValue.expectValue.displayPriority);
          expect(compareTwoButtonRect.top).assertEqual(parentRect.top);
          // expect(Math.abs((compareTwoButtonRect.bottom - compareTwoButtonRect.top)- uiContext.vp2px(compareTwoButtonHeight)) <= 1).assertTrue();
        } else if (data.testValue.describe == 'SetPriority') {
          //Check whether the position of the reference component is correct
          let compareOneButtonComponent: Attrs = Utils.getComponentByKey(data.pageConfig.compareOneButtonKey!);
          console.info('[' + data.caseTag + '] data.testValue.describe is:' + data.testValue.describe);
          console.info('[' + data.caseTag + '] compareOneButton displayPriority is:'
            + compareOneButtonComponent.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] displayPriority is:' + data.viewObj!.$attrs.displayPriority);
          console.info('[' + data.caseTag + '] parentRect.top is:' + parentRect.top);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.top is:' + compareTwoButtonRect.top);
          console.info('[' + data.caseTag + '] compareTwoButtonRect.bottom is:' + compareTwoButtonRect.bottom);
          expect(compareOneButtonComponent.$attrs.displayPriority)
            .assertEqual(data.testValue.expectValue.compareOneButtonDisplayPriority);
          expect(data.viewObj!.$attrs.displayPriority).assertEqual(data.testValue.expectValue.displayPriority);
          expect(compareTwoButtonRect.top).assertEqual(parentRect.top);
          // expect(Math.abs((compareTwoButtonRect.bottom - compareTwoButtonRect.top)- uiContext.vp2px(compareTwoButtonHeight)) <= 1).assertTrue();
        } else {
          console.info('[' + data.caseTag + '] data.testValue.describe is error:' + data.testValue.describe);
        }
      } else {
        console.info('[' + data.caseTag + '] data.pageConfig.containerView is error:' + data.pageConfig.containerView);
      }
    });
  })
}