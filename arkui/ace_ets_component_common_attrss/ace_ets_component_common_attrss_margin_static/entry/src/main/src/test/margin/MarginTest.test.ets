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

// import { vp2px } from '@ohos.arkui.component';
import { AttrsManager, GrowValue } from '../../../ets/MainAbility/common/AttrsManager';
import Utils, { BasePageConfig, PageConfig, TestValue } from '../../../ets/MainAbility/common/Utils';
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
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
// class TestValue {
//   describe: string = '';
//   setValue: Margin = {} as Margin;
//   expectValue: Margin = {} as Margin;
// }
//
// class Margin {
//   margin?: jsonx.JsonElement;
//   top?: number;
//   right?: number;
//   bottom?: number;
//   left?: number;
// }
//
// class PageConfig {
//   testName: string = '';
//   pageName: string = '';
//   pageUrl: string = '';
//   targetGroupView: string = '';
//   parentComponentKey: string = '';
//   buttonComponentKey: string = '';
//   childWidth: number = 0;
//   childHeight: number = 0;
//   parentWidth: number = 0;
//   parentHeight: number = 0;
// }

export default function marginTest() {
  let setInit: GrowValue = {
    margin: {
      top: 0, right: 0, bottom: 0, left: 0
    }
  }
  let getInit = '0.00vp';
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
  let supportView = [
    'AlphabetIndexer',
    'Button',
    'Blank',
    //'Checkbox',
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
    //'MenuItem',
    //'MenuItemGroup',
    'Navigation',
    'NavRouter',
    'Progress',
    'QRCode',
    //'Radio',
    'Rating',
    'ScrollBar',
    'Search',
    'Slider',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    //'Toggle',
    //'Web',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Badge',
    'Column',
    'Counter',
    //'Flex',
    //'FlowItem',
    'GridRow',
    'GridCol',
    'Grid',
    //'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    'Refresh',
    'RelativeContainer',
    'Row',
    'Scroll',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent'
  ]

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
      }
    },
    expectValue: {
      margin: {
        top: '20.00vp', right: '30.00vp', bottom: '30.00vp', left: '20.00vp'
      },
      //uicontext.vp2px()接口不通，暂用数字平替
      // top: vp2px(20),
      // right: vp2px(30),
      // bottom: vp2px(30),
      // left: vp2px(20)
      top: 20,
      right: 30,
      bottom: 30,
      left: 20
    }
  }, {
    describe: 'SetTop',
    setValue: {
      margin: {
        top: 50
      }
    },
    expectValue: {
      margin: {
        top: '50.00vp', right: '0.00vp', bottom: '0.00vp', left: '0.00vp'
      },
      //uicontext.vp2px()接口不通，暂用数字平替
      // top: vp2px(50),
      // right: vp2px(0),
      // bottom: vp2px(0),
      // left: vp2px(0)
      top: 50,
      right: 0,
      bottom: 0,
      left: 0
    }
  }, {
    describe: 'SetRight',
    setValue: {
      margin: {
        right: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '50.00vp', bottom: '0.00vp', left: '0.00vp'
      },
      //uicontext.vp2px()接口不通，暂用数字平替
      // top: vp2px(0),
      // right: vp2px(50),
      // bottom: vp2px(0),
      // left: vp2px(0)
      top: 0,
      right: 50,
      bottom: 0,
      left: 0
    }
  }, {
    describe: 'SetBottom',
    setValue: {
      margin: {
        bottom: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '0.00vp', bottom: '50.00vp', left: '0.00vp'
      },
      //uicontext.vp2px()接口不通，暂用数字平替
      // top: vp2px(0),
      // right: vp2px(0),
      // bottom: vp2px(50),
      // left: vp2px(0)
      top: 0,
      right: 0,
      bottom: 50,
      left: 0
    }
  }, {
    describe: 'SetLeft',
    setValue: {
      margin: {
        left: 50
      }
    },
    expectValue: {
      margin: {
        top: '0.00vp', right: '0.00vp', bottom: '0.00vp', left: '50.00vp'
      },
      //uicontext.vp2px()接口不通，暂用数字平替
      // top: vp2px(0),
      // right: vp2px(0),
      // bottom: vp2px(0),
      // left: vp2px(50)
      top: 0,
      right: 0,
      bottom: 0,
      left: 50
    }
  }]

  describe('MarginTest', () => {
    beforeAll(() => {
      console.info("hitTestBehaviorTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    //Create test cases by config.
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Initialize margin properties
      console.info('[' + data.caseTag + '] setValue : ' + setInit);
      AttrsManager.change(data.caseTag, setInit);
      await Utils.sleep(1000);
      //Confirm successful setting of margin attribute
      let referenceRectBefore: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      expect(referenceRectBefore.getElement('$attrs').getString('margin')).assertEqual(getInit);
      //Set test values
      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);
      let referenceRectAfter: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey);
      //component
      let rect = Utils.getComponentRect(data.pageConfig.componentKey);
      //parentComponent
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey);
      //Component margin
      let top = 0.0;
      let left = 0.0;
      let right = 0.0;
      let bottom = 0.0;
      if ((data.pageConfig.componentKey == 'ListItem')
        || (data.pageConfig.componentKey == 'ListItemGroup')) {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = referenceRect.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey);
        //Component to reference component and parent component margin calculation
        top = rect.top - referenceRect.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if (data.pageConfig.componentKey == 'StepperItem') {
        //parentComponent
        // let rectParent = Utils.getComponentRectByObj(JSON.parseJsonElement(JSON.stringify(getInspectorTree()))
        //   .$children[0]
        //   .$children[0]
        //   .$children[0]);
        // //Component to  parent component margin calculation
        // top = rect.top - rectParent.top;
        // left = rect.left - rectParent.left;
        // right = rectParent.right - rect.right;
        // bottom = rectParent.bottom - rect.bottom;
      } else if ((data.pageConfig.componentKey == 'GridCol')
        || (data.pageConfig.componentKey == 'FlowItem')
        || (data.pageConfig.componentKey == 'GridItem')
        || (data.pageConfig.componentKey == 'MenuItem')
        || (data.pageConfig.componentKey == 'MenuItemGroup')) {
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.buttonComponentKey)
        //Component to reference component and parent component margin calculation
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
      //Confirm if the margin is correct
      expect(referenceRectAfter.getElement('$attrs').getString('margin')).assertEqual(JSON.stringify(data.testValue.expectValue.margin));
      expect(Math.abs(top - data.testValue.expectValue.top) <= 1).assertTrue();
      expect(Math.abs(right - data.testValue.expectValue.right) <= 1).assertTrue();
      expect(Math.abs(bottom - data.testValue.expectValue.bottom) <= 1).assertTrue();
      expect(Math.abs(left - data.testValue.expectValue.left) <= 1).assertTrue();
    });
  })
}