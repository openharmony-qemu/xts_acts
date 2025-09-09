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
import Utils, {CurrentRatio, BasePageConfig, PageConfig, TestValue, RectValue,StrJsonObj } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, expect,beforeAll } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
async function executeTab(data: BasePageConfig, referenceOneValue: string, textValue: string, referenceTwoValue: string) {
  expect(Utils.performKeyEventDownUp(2049, 'Tab')).assertEqual(true);
  await Utils.sleep(1000);
  console.info('[' + data.caseTag + '] Press Tab.');
  let referenceOneComponent: StrJsonObj = Utils.getComponentByKey(data.pageConfig.referenceOneComponentKey??'');
  let textComponent: StrJsonObj = Utils.getComponentByKey(data.pageConfig.textComponentKey??'');
  let referenceTwoComponent: StrJsonObj = Utils.getComponentByKey(data.pageConfig.referenceTwoComponentKey??'');
  
  console.info('[' + data.caseTag + '] referenceOneComponent.$attrs.label:' + referenceOneComponent.$attrs.label);
  expect(referenceOneComponent.$attrs.label).assertEqual(referenceOneValue);
  
  console.info('[' + data.caseTag + '] textComponent.$attrs.content:' + textComponent.$attrs.content);
  expect(textComponent.$attrs.content).assertEqual(textValue);
  
  console.info('[' + data.caseTag + '] referenceTwoComponent.$attrs.label:' + referenceTwoComponent.$attrs.label);
  expect(referenceTwoComponent.$attrs.label).assertEqual(referenceTwoValue);
}

export default function TabIndexTest() {
  
  let supportView = [
    'Web',
    'SideBarContainer',
    'Stepper',
    'StepperItem',
    'Select',
  ]
  
  let pageConfig: PageConfig = {
    testName: 'testTabIndex',
    pageName: 'TabIndexPage',
    pageUrl: 'MainAbility/pages/tabIndex/TabIndexPage',
    textComponentKey: 'textComponentKey',
    referenceOneComponentKey: 'referenceOneComponentKey',
    referenceTwoComponentKey: 'referenceTwoComponentKey',
    sharePage: false
  }
  
  let testValues: TestValue[] = [{
    describe: 'SetLessThanZero',
    setValue: -1,
    expectValue: -1
  }, {
    describe: 'SetEqualZero',
    setValue: 0,
    expectValue: 0
  }, {
    describe: 'SetEqualOne',
    setValue: 1,
    expectValue: 1
  }, {
    describe: 'SetEqualTwo',
    setValue: 2,
    expectValue: 2
  }]

  describe('TabIndexTest', () => {
    beforeAll(() => {
      console.info('TabIndexTest beforeEach start')
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrsTabindex.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    

    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      
      let requestFocusText = Utils.requestFocus(data.pageConfig.textComponentKey??'');
      expect(requestFocusText).assertEqual(true);
      await Utils.sleep(1000);

      if ('SetLessThanZero' == data.testValue.describe) {

        
        await executeTab(data, 'onFocus', '', '');
        
        await executeTab(data, 'onBlur', '', 'onFocus');

        
        let viewObj: StrJsonObj = Utils.getComponentByKey(data.pageConfig.componentKey??'');
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);
      } else if ('SetEqualZero' == data.testValue.describe) {

        
        await executeTab(data, 'onFocus', '', '');
        
        await executeTab(data, 'onBlur', '', 'onFocus');
        
        await executeTab(data, 'onBlur', 'onFocus', 'onBlur');

        let viewObj: StrJsonObj = Utils.getComponentByKey(data.pageConfig.componentKey??'');
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);

      } else if ('SetEqualOne' == data.testValue.describe) {

        
        await executeTab(data, '', 'onFocus', '');
        
        await executeTab(data, 'onFocus', 'onBlur', '');
        
        await executeTab(data, 'onBlur', 'onBlur', 'onFocus');

        let viewObj: StrJsonObj = Utils.getComponentByKey(data.pageConfig.componentKey??'');
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);

      } else if ('SetEqualTwo' == data.testValue.describe) {

        
        await executeTab(data, 'onFocus', '', '');
        
        await executeTab(data, 'onBlur', 'onFocus', '');
        
        await executeTab(data, 'onBlur', 'onBlur', 'onFocus');

        
        let viewObj: StrJsonObj = Utils.getComponentByKey(data.pageConfig.componentKey??'');
        console.info('[' + data.caseTag + '] viewObj.$attrs.tabIndex:' + viewObj.$attrs.tabIndex);
        expect(viewObj.$attrs.tabIndex).assertEqual(data.testValue.expectValue);
      }
    })
  })


}