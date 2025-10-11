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

import Utils, { BasePageConfig, PageConfig, TestValue,GrowValue, ExpectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign,  Color, $r, Margin } from '@ohos.arkui.component';
import { jsonx } from "std/core";
import { UIContext } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function marginTest() {
  console.info("MarginTest beforeAll start");
  await UtilsTest.msSleep(4000)
  await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.margin.nowear.test.static", "EntryAbility")
  await UtilsTest.msSleep(4000)
  let context:UIContext = AppStorage.get<UIContext>('uiContext') as UIContext
  let setInit: Margin = {
    top: 0, right: 0, bottom: 0, left: 0
  }
  let getInit = '0.00vp';
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
  let supportView: Array<string> = new Array<string>(
    'Select',
    'Stepper',
    'StepperItem',
    'ColumnSplit',
    'RowSplit',
    'SideBarContainer',
    'WaterFlow'
  )

  let pageConfig: PageConfig = {
    testName: 'testMargin',
    pageName: 'MarginPage',
    pageUrl: 'MainAbility/pages/margin/MarginPage',
    targetGroupView: 'targetGroupView',
    parentComponentKey: 'parentComponentKey',
    buttonComponentKey: 'buttonComponentKey',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetAll',
    setValue: {
      margin: {
        top: 20,
        right: 30,
        bottom: 30,
        left: 20
      } as Margin
    },
    expectValue: {
      margin: {
        top: '20.00vp', right: '30.00vp', bottom: '30.00vp', left: '20.00vp'
      } as Margin,
      
      top: context.vp2px(20),
      right: context.vp2px(30),
      bottom: context.vp2px(30),
      left: context.vp2px(20)
    }
  }, {
    describe: 'SetTop',
    setValue: {
      margin: {
        top: 50
      } as Margin
    },
    expectValue: {
      margin: {
        top: '50.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp'
      } as Margin,
      
      top: context.vp2px(50),
      right: context.vp2px(0),
      bottom: context.vp2px(0),
      left: context.vp2px(0)
    }
  }, {
    describe: 'SetRight',
    setValue: {
      margin: {
        right: 50
      } as Margin
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '50.00vp', bottom: '0.00vp', left: '0.00vp'
      } as Margin,
      
      top: context.vp2px(0),
      right: context.vp2px(50),
      bottom: context.vp2px(0),
      left: context.vp2px(0)
    }
  }, {
    describe: 'SetBottom',
    setValue: {
      margin: {
        bottom: 50
      } as Margin
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '0.00vp', bottom: '50.00vp', left: '0.00vp'
      }  as Margin,
      
      top: context.vp2px(0),
      right: context.vp2px(0),
      bottom: context.vp2px(50),
      left: context.vp2px(0)
    }
  }, {
    describe: 'SetLeft',
    setValue: {
      margin: {
        left: 50
      } as Margin
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '50.00vp'
      }  as Margin,
      
      top: context.vp2px(0),
      right: context.vp2px(0),
      bottom: context.vp2px(0),
      left: context.vp2px(50)
    }
  }]

  describe('MarginTest', () => {
    beforeAll(() => {

    });
    
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      
      console.info('[' + data.caseTag + '] setValue : ' + setInit);
      AppStorage.setOrCreate<Margin>('_margin', setInit)
      await Utils.sleep(1000);
      
      let referenceRectBefore: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(referenceRectBefore.getElement('$attrs').getString('margin')).assertEqual(getInit);
      
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AppStorage.setOrCreate<Margin>('_margin', data.testValue.setValue.margin)
      await Utils.sleep(1000);
      let referenceRectAfter: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);
      
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      
      let top = 0.0;
      let left = 0.0;
      let right = 0.0;
      let bottom = 0.0;
      if ((data.pageConfig.componentKey == 'ListItem')
        || (data.pageConfig.componentKey == 'ListItemGroup')) {
        
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = referenceRect.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        
        top = rect.top - referenceRect.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if (data.pageConfig.componentKey == 'StepperItem') {
        
        let rectParent = Utils.getComponentRectByObj(JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray("$children")[0]
          .getArray("$children")[0]
          .getArray("$children")[0]);
        
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if ((data.pageConfig.componentKey == 'GridCol')
        || (data.pageConfig.componentKey == 'FlowItem')
        || (data.pageConfig.componentKey == 'GridItem')
        || (data.pageConfig.componentKey == 'MenuItem')
        || (data.pageConfig.componentKey == 'MenuItemGroup')) {
        
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else {
        
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey)
        
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = referenceRect.left - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      }
      console.info('[' + data.caseTag + ']' + 'top is: ' + top);
      console.info('[' + data.caseTag + ']' + 'left is: ' + left);
      console.info('[' + data.caseTag + ']' + 'right is: ' + right);
      console.info('[' + data.caseTag + ']' + 'bottom is: ' + bottom);
      console.info('[' + data.caseTag + ']' + 'margin is: ' + referenceRectAfter.getElement('$attrs').getString('margin'));
      console.log("data.testValue.expectValue.margin====" + JSON.stringify(data.testValue.expectValue.margin))
      
      expect(referenceRectAfter.getElement('$attrs').getString('margin')).assertEqual(JSON.stringify(data.testValue.expectValue.margin));
      expect(Math.abs(top - (data.testValue.expectValue.top as number).toInt()) <= 1).assertTrue();
      expect(Math.abs(right - (data.testValue.expectValue.right as number).toInt()) <= 1).assertTrue();
      console.log('(data.testValue.expectValue.bottom as number).toInt()' + (data.testValue.expectValue.bottom as number).toInt())
      expect(Math.abs(bottom - (data.testValue.expectValue.bottom as number).toInt()) <= 1).assertTrue();
      expect(Math.abs(left - (data.testValue.expectValue.left as number).toInt()) <= 1).assertTrue();
    });
  })
}