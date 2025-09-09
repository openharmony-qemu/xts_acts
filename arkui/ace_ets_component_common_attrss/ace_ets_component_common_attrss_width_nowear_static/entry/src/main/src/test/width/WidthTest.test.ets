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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, expect,beforeAll } from '../../../../hypium/index';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility, stopApplication } from '../Util.test'
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
interface Attrs{
  $attrs: SetValue
}
/**
 * Test of common attribute: width
 */
export default function widthTest() {
  
  let supportView = new Array<string>(
    'Select',
    'Web',
    'ColumnSplit',
    'RowSplit',
    'WaterFlow',
    'Stepper',
    'FlowItem'
  )
  
  let parentWidth = 300;
  let parentHeight = 300;
  
  let parentBackGroundColor = Color.Red
  let BackGroundColor = Color.Orange

  
  let pageConfig: PageConfig = {
    testName: 'testWidth',
    pageName: 'WidthPage',
    pageUrl: 'MainAbility/pages/width/WidthPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    parentBackGroundColor: parentBackGroundColor,
    BackGroundColor: BackGroundColor,
    parentComponentKey: 'parentComponentKey'
  }

  
  let testValues: TestValue[] = [{
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  }]

  /**
   * Create test suite.
   */
  describe('WidthTest', () => {
    beforeAll(() => {
      console.info("WidthTest beforeEach start");
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.width.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    
CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {

      
      let rect: RectValue = Utils.getComponentRect(data.pageConfig.componentKey??'');

      
      let rectParent: RectValue = Utils.getComponentRect(data.pageConfig.parentComponentKey??'');
      let attrs = data.viewObj as Attrs
      console.info('[' + data.caseTag + '] data.testValue.expectValue.width:' + data.testValue.expectValue.width);
      console.info('[' + data.caseTag + '] data.viewObj.$attrs.width:' + attrs?.$attrs.width);

      
      let strJsonRectWidth = rect.right - rect.left;
      console.info('[' + data.caseTag + '] strJsonRectWidth is:' + strJsonRectWidth);

      if (data.testValue.describe == 'ExceedParent') {
        
        expect((rectParent.left > rect.left || rectParent.right < rect.right))
          .assertEqual(data.testValue.expectValue.ExceedParent);
      }

      
      expect(attrs?.$attrs.width).assertEqual(data.testValue.expectValue.widthCompare);

      
      expect(Math.abs(strJsonRectWidth - (data.testValue.expectValue.width as number)) <= 1).assertTrue();
    })
  })
}