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

import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, SetValue, Attrs,Obj } from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect, beforeAll } from '../../../../hypium/index'
import {  ItemAlign, VerticalAlign, HorizontalAlign, Position } from '@ohos.arkui.component'
import { UIContext, Router } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector'
import { AttrsManager } from '../../../ets/MainAbility/common/AttrsManager'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();
export default function onAreaChangeTest() {
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
    //'Menu',
    'MenuItem',
    //'MenuItemGroup',
    'Navigation',
    'NavRouter',
    //'NavDestination',
    'PatternLock',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    //'RichText',
    'ScrollBar',
    'Search',
    //'Select',
    'Slider',
    'Stepper',
    'StepperItem',
    'Text',
    'TextArea',
    'TextClock',
    'TextInput',
    'TextPicker',
    'TextTimer',
    'TimePicker',
    'Toggle',
    'Badge',
    'Column',
    'ColumnSplit',
    'Flex',
    'FlowItem',
    'GridRow',
    //'GridCol',
    'Grid',
    'GridItem',
    'List',
    'ListItem',
    'ListItemGroup',
    'Navigator',
    'Panel',
    //'Refresh',
    'RelativeContainer',
    'Row',
    'RowSplit',
    'Scroll',
    'SideBarContainer',
    'Stack',
    'Swiper',
    'Tabs',
    'TabContent',
    'WaterFlow',
    'Circle',
    'Ellipse',
    'Line',
    'Polyline',
    'Polygon',
    'Path',
    'Rect',
    'Shape',
    'Counter'
  )

  //Custom params.
  let parentWidth = 300;
  let parentHeight = 600;
  let parentMargin = 30;
  let parentKey = 'parentKey'
  let compareButtonKey = 'compareButtonKey'
  let compareOldTextKey = 'compareOldTextKey'
  let compareNewTextKey = 'compareNewTextKey'

  let pageConfig: PageConfig = {
    testName: 'testOnAreaChange',
    pageName: 'OnAreaChangePage',
    pageUrl: 'MainAbility/pages/onAreaChange/OnAreaChangePage',
    targetGroupView: 'targetGroupView',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentMargin: parentMargin,
    parentKey: parentKey,
    compareButtonKey: compareButtonKey,
    compareOldTextKey: compareOldTextKey,
    compareNewTextKey: compareNewTextKey
  }


  //Test content and expected results
  let testValues: TestValue[] = [{
    describe: 'SetMove',
    setValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    },
    expectValue: {
      compareButtonWidth: 120,
      compareButtonHeight: 120
    }
  }, {
    describe: 'SetWidthHeight',
    setValue: {
      width: 60,
      height: 60
    },
    expectValue: {
      width: 60,
      height: 60
    }
  }, {
    describe: 'SetOffset',
    exceptView: ['RichText'],
    setValue: {
      offset: {
        x: 50, y: 50
      } as Position
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      // left: uiContext.vp2px(50), top: uiContext.vp2px(50)
    }
  }]

  describe('OnAreaChangeTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Get Information about the location of the target component before the change
      let parentRectBefore: RectValue = Utils.getComponentRect(data.pageConfig.parentKey);
      let targetRectBefore: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);
      if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
        console.info('[' + data.caseTag + '] Find Parent Component Before');
        let parentComponent = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[1];
        parentComponent.getArray('$children').forEach((element) => {
          if ('Swiper' == element.getString('type')) {
            parentRectBefore = Utils.getComponentRectByObj(element as Obj);
          }
        });
      }
      console.info('[' + data.caseTag + '] targetRectBefore: ' + JSON.stringify(targetRectBefore));
      console.info('[' + data.caseTag + '] parentRectBefore: ' + JSON.stringify(parentRectBefore));

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      //After the change, obtain the location information of the target component and parent container
      let parentRectAfter: RectValue = Utils.getComponentRect(data.pageConfig.parentKey);
      let targetRectAfter: RectValue = Utils.getComponentRect(data.pageConfig.componentKey);
      let RectAfter = parentRectAfter
      let compareOldTextComponent: Attrs = Utils.getComponentByKey(data.pageConfig.compareOldTextKey);
      let compareNewTextComponent: Attrs = Utils.getComponentByKey(data.pageConfig.compareNewTextKey);
      if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
        console.info('[' + data.caseTag + '] Find Parent Component After');
        let parentComponent = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
          .getArray('$children')[0]
          .getArray('$children')[1];
        parentComponent.getArray('$children').forEach((element) => {
          if ('Swiper' == element.getString('type')) {
            parentRectAfter = Utils.getComponentRectByObj(element as Obj);
          }
        });
      }
      console.info('[' + data.caseTag + '] compareOldTextComponent.$attrs.content: ' +
      compareOldTextComponent.$attrs.content);
      console.info('[' + data.caseTag + '] compareNewTextComponent.$attrs.content: ' +
      compareNewTextComponent.$attrs.content);
      console.info('[' + data.caseTag + '] targetRectAfter: ' + JSON.stringify(targetRectAfter));

      if (data.testValue.describe == 'SetMove') {
        let compareButtonRectAfter: RectValue = Utils.getComponentRect(data.pageConfig.compareButtonKey);
        console.info('[' + data.caseTag + '] compareButtonRectAfter: ' + JSON.stringify(compareButtonRectAfter));
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        expect(Math.abs(uiContext.px2vp(compareButtonRectAfter.right - compareButtonRectAfter.left) -
        data.testValue.expectValue.compareButtonWidth!) <= 2).assertTrue();
        expect(Math.abs(uiContext.px2vp(compareButtonRectAfter.bottom - compareButtonRectAfter.top) -
        data.testValue.expectValue.compareButtonHeight!) <= 2).assertTrue();
        await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
          targetRectAfter, parentRectBefore, parentRectAfter);
      } else if (data.testValue.describe == 'SetWidthHeight') {
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        if ((data.pageConfig.componentKey == 'GridCol') || (data.pageConfig.componentKey == 'ListItemGroup')) {
          expect(Math.abs(uiContext.px2vp(targetRectAfter.bottom - targetRectAfter.top) -
          data.testValue.expectValue.height!) <= 1).assertTrue();
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else if ((data.pageConfig.componentKey == 'TabContent') || (data.pageConfig.componentKey == 'StepperItem')) {
          expect(Math.abs(uiContext.px2vp(RectAfter.right - RectAfter.left) - data.testValue.expectValue.width!) <= 2)
            .assertTrue();
          expect(Math.abs(uiContext.px2vp(RectAfter.bottom - RectAfter.top) - data.testValue.expectValue.height!) <= 2)
            .assertTrue();
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        } else {
          expect(Math.abs(uiContext.px2vp(targetRectAfter.right - targetRectAfter.left) - data.testValue.expectValue.width!) <= 2)
            .assertTrue();
          expect(Math.abs(uiContext.px2vp(targetRectAfter.bottom - targetRectAfter.top) - data.testValue.expectValue.height!) <= 2)
            .assertTrue();
          await checkResults(data, compareOldTextComponent, compareNewTextComponent, targetRectBefore,
            targetRectAfter, parentRectBefore, parentRectAfter);
        }
      } else if (data.testValue.describe == 'SetOffset') {
        console.info('[' + data.caseTag + '] data.testValue.describe: ' + data.testValue.describe);
        let viewObj: Attrs = Utils.getComponentByKey(data.pageConfig.componentKey);
        console.info('[' + data.caseTag + '] viewObj.$attrs.offset.x: ' + viewObj.$attrs.offset!.x);
        expect(viewObj.$attrs.offset!.x).assertEqual(data.testValue.expectValue.x);
        console.info('[' + data.caseTag + '] viewObj.$attrs.offset.y: ' + viewObj.$attrs.offset!.y);
        expect(viewObj.$attrs.offset!.y).assertEqual(data.testValue.expectValue.y);
        expect(Math.abs(Number(targetRectAfter.left - targetRectBefore.left) -
        Number(data.testValue.expectValue.left!)) <= 2).assertTrue();
        expect(Math.abs(Number(targetRectAfter.top - targetRectBefore.top) -
        Number(data.testValue.expectValue.top!)) <= 2).assertTrue();
        expect(compareOldTextComponent.$attrs.content).assertEqual('');
        expect(compareNewTextComponent.$attrs.content).assertEqual('');
      }
    });
  })
}
async function checkResults(data: BasePageConfig, compareOldTextComponent: Attrs, compareNewTextComponent: Attrs, targetRectBefore: RectValue,
  targetRectAfter: RectValue, parentRectBefore: RectValue, parentRectAfter: RectValue) {
  //Check that the position information before the change is correct
  console.info('[' + data.caseTag + '] checkResults');
  expect(compareOldTextComponent.$attrs.content != '').assertEqual(true);
  expect(compareNewTextComponent.$attrs.content != '').assertEqual(true);
  let compareOldTextObj = JSON.parseJsonElement(compareOldTextComponent.$attrs.content??'');
  let compareNewTextObj = JSON.parseJsonElement(compareNewTextComponent.$attrs.content??'');
  console.info('[' + data.caseTag + '] compareOldTextObj width: ' + compareOldTextObj.getInteger('width'));
  expect(Math.abs(compareOldTextObj.getInteger('width') - uiContext.px2vp(targetRectBefore.right - targetRectBefore.left)) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj height: ' + compareOldTextObj.getInteger('height'));
  expect(Math.abs(compareOldTextObj.getInteger('height') - uiContext.px2vp(targetRectBefore.bottom - targetRectBefore.top)) <= 2)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.position.x: ' + compareOldTextObj.getElement('position').getInteger('x'));
  expect(Math.abs(compareOldTextObj.getElement('position').getInteger('x') - uiContext.px2vp(targetRectBefore.left - parentRectBefore.left)) <= 2)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.position.y: ' + compareOldTextObj.getElement('position').getInteger('y'));
  expect(Math.abs(compareOldTextObj.getElement('position').getInteger('y') - uiContext.px2vp(targetRectBefore.top - parentRectBefore.top)) <= 2)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.globalPosition.x: ' + compareOldTextObj.getElement('globalPosition').getInteger('x'));
  expect(Math.abs(compareOldTextObj.getElement('globalPosition').getInteger('x') - uiContext.px2vp(targetRectBefore.left)) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.globalPosition.y: ' + compareOldTextObj.getElement('globalPosition').getInteger('y'));
  expect(Math.abs(compareOldTextObj.getElement('globalPosition').getInteger('y') - uiContext.px2vp(targetRectBefore.top)) <= 2).assertTrue();

  //Check whether the changed position information is correct
  console.info('[' + data.caseTag + '] compareOldTextObj.width: ' + compareOldTextObj.getInteger('width'));
  expect(Math.abs(compareOldTextObj.getInteger('width') - uiContext.px2vp(targetRectAfter.right - targetRectAfter.left)) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.height: ' + compareOldTextObj.getInteger('height'));
  expect(Math.abs(compareOldTextObj.getInteger('height') - uiContext.px2vp(targetRectAfter.bottom - targetRectAfter.top)) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.position.x: ' + compareOldTextObj.getElement('position').getInteger('x'));
  expect(Math.abs(compareOldTextObj.getElement('position').getInteger('x') - uiContext.px2vp(targetRectAfter.left - parentRectAfter.left)) <= 2)
    .assertTrue();
  console.info('[' + data.caseTag + '] compareOldTextObj.position.y: ' + compareOldTextObj.getElement('position').getInteger('y'));
  expect(Math.abs(compareOldTextObj.getElement('position').getInteger('y') - uiContext.px2vp(targetRectAfter.top - parentRectAfter.top)) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] compareNewTextObj.globalPosition.x: ' + compareNewTextObj.getElement('globalPosition').getInteger('x'));
  expect(Math.abs(compareNewTextObj.getElement('globalPosition').getInteger('x') - uiContext.px2vp(targetRectAfter.left)) <= 2).assertTrue();
  console.info('[' + data.caseTag + '] compareNewTextObj.globalPosition.y: ' + compareNewTextObj.getElement('globalPosition').getInteger('y'));
  expect(Math.abs(compareNewTextObj.getElement('globalPosition').getInteger('y') - uiContext.px2vp(targetRectAfter.top)) <= 2).assertTrue();
}

