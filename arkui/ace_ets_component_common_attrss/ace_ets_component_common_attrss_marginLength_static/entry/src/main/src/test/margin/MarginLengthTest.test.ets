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

import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager';
import {Color,$r} from '@ohos.arkui.component'
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,SetValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, expect,beforeAll } from '../../../../hypium/index';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface Attrs{
  $attrs: SetValue
}

export default function marginLengthTest() {
  let childWidth = 100;
  let childHeight = 50;
  let parentWidth = 400;
  let parentHeight = 600;
  let supportView: Array<string> = new Array<string>(
   'AlphabetIndexer',
    'Button',
    'Blank',
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
    //'MenuItem',
    //'MenuItemGroup',
    'Navigation',
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
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
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
  )
  let pageConfig: PageConfig = {
    testName: 'testMargin',
    pageName: 'MarginPageLength',
    pageUrl: 'MainAbility/pages/margin/MarginPageLength',
    targetGroupView: 'targetGroupView',
    parentComponentKey: 'parentComponentKey',
    referenceComponentKey: 'referenceComponentKey',
    childWidth: childWidth,
    childHeight: childHeight,
    parentWidth: parentWidth,
    parentHeight: parentHeight
  }

  let testValues: TestValue[] = [{
    describe: 'SetNumber',
    setValue: {
      margin: 50,
    },
    expectValue: {
      margin: '50.00vp',
      //uicontext.vp2px()接口不通，暂用数字平替
      // top: vp2px(50),
      // right: vp2px(50),
      // bottom: vp2px(50),
      // left: vp2px(50)
      top: 50,
      right: 50,
      bottom: 50,
      left: 50
    }
  }, {
    describe: 'SetStringPx',
    setValue: {
      margin: '100px',
    },
    expectValue: {
      margin: '100.00px',
      top: 100,
      right: 100,
      bottom: 100,
      left: 100
    }
  }, {
    describe: 'SetResource',
    setValue: {
      margin: $r('app.float.50vp'),
    },
    expectValue: {
      margin: '50.00vp',
      //uicontext.vp2px()接口不通，暂用数字平替
      // top: vp2px(50),
      // right: vp2px(50),
      // bottom: vp2px(50),
      // left: vp2px(50)
      top: 50,
      right: 50,
      bottom: 50,
      left: 50
    }
  }]

  describe('MarginLengthTest', () => {
    beforeAll(() => {
      console.info("marginLengthTest beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //component
      let rect = Utils.getComponentRect(data.pageConfig.componentKey??'');
      //parentComponent
      let rectParent = Utils.getComponentRect(data.pageConfig.parentComponentKey??'');
      //Component margin
      let top: number = 0;
      let left: number = 0;
      let right: number = 0;
      let bottom: number= 0;
      if ((data.pageConfig.componentKey == 'ListItem')
        || (data.pageConfig.componentKey == 'ListItemGroup')) {
        //Reference component
        let rectReference = Utils.getComponentRect(data.pageConfig.referenceComponentKey??'');
        //Component to reference component and parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectReference.top - rect.bottom;
      } else if (data.pageConfig.componentKey == 'TabContent') {
        //Reference component
        let referenceRect = Utils.getComponentRect(data.pageConfig.referenceComponentKey??'');
        //Component to reference component and parent component margin calculation
        top = rect.top - referenceRect.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      } else if (data.pageConfig.componentKey == 'StepperItem') {
        //parentComponent
        // let rectParent = Utils.getComponentRectByObj(JSON.parse(JSON.stringify(inspector.getInspectorTree()))
        //   .$children[0]
        //   .$children[0]
        //   .$children[0]);
        // //Component to  parent component margin calculation
        // top = rect.top - rectParent.top;
        // left = rect.left - rectParent.left;
        // right = rectParent.right - rect.right;
        // bottom = rectParent.bottom - rect.bottom;
      } else {
        //Component to  parent component margin calculation
        top = rect.top - rectParent.top;
        left = rect.left - rectParent.left;
        right = rectParent.right - rect.right;
        bottom = rectParent.bottom - rect.bottom;
      }
      let attrs = data.viewObj as Attrs
      console.info('[' + data.caseTag + ']' + 'top is:' + top);
      console.info('[' + data.caseTag + ']' + 'left is:' + left);
      console.info('[' + data.caseTag + ']' + 'right is:' + right);
      console.info('[' + data.caseTag + ']' + 'bottom is:' + bottom);
      console.info('[' + data.caseTag + ']' + 'margin is:' + attrs?.$attrs.margin);
      //Confirm if the margin is correct

      expect(attrs?.$attrs.margin).assertEqual(data.testValue.expectValue.margin);
      expect(Math.abs(top - (data.testValue.expectValue.top as number)) <= 1).assertTrue();
      expect(Math.abs(right - (data.testValue.expectValue.right as number)) <= 1).assertTrue();
      expect(Math.abs(bottom - (data.testValue.expectValue.bottom as number)) <= 1).assertTrue();
      expect(Math.abs(left - (data.testValue.expectValue.left as number)) <= 1).assertTrue();
    });
  })
}