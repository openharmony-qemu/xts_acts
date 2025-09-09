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
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue, ExpectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import { describe, beforeAll, expect } from '../../../../hypium/index';
import { AlignRuleOption, VerticalAlign, HorizontalAlign,  Position, $r } from '@ohos.arkui.component';
import { UIContext } from "@ohos.arkui.UIContext";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest} from '../Util.test'
let domain: int= 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
const uiContext = new UIContext();


export default function MarkAnchorTest() {
  
  let supportView: Array<string> = new Array<string>('Select', 'SideBarContainer', 'WaterFlow', 'RowSplit', 'ColumnSplit', 'FlowItem', 'Stepper', 'StepperItem')


  
  let parentWidth = 300;
  let parentHeight = 400;
  let subassemblyWidth = 100;
  let subassemblyHeight = 100;

  
  let pageConfig: PageConfig = {
    testName: 'testMarkAnchor',
    pageName: 'MarkAnchorPage',
    pageUrl: 'MainAbility/pages/markAnchor/MarkAnchorPage',
    parentWidth: parentWidth,
    parentHeight: parentHeight,
    subassemblyWidth: subassemblyWidth,
    subassemblyHeight: subassemblyHeight,
  }

  
  let testValues: TestValue[] = [{
    describe: 'Number',
    setValue: {
      x: 50, y: 50
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      left: UIContext.getFocusedUIContext()!.vp2px(50), top: UIContext.getFocusedUIContext()!.vp2px(50)
    }
  }, {
    describe: 'StringPx',
    setValue: {
      x: '150px', y: '150px'
    },
    expectValue: {
      x: '150.00px', y: '150.00px',
      
    }
  }, {
    describe: 'StringPercent',
    setValue: {
      x: '50%', y: '50%'
    },
    expectValue: {
      x: '50.00%', y: '50.00%'
    }
  }, {
    describe: 'Resource',
    setValue: {
      x: $r('app.float.50vp'), y: $r('app.float.50vp')
    },
    expectValue: {
      x: '50.00vp', y: '50.00vp',
      
    }
  }]

  describe('MarkAnchorTest', () => {
    beforeAll(() => {
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.markAnchor.nowear.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    
    CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      
      console.info('[' + data.caseTag + '] restore the target Component to its original position');
      AttrsManager.change(data.caseTag, {
        x: 0, y: 0
      });
      await Utils.sleep(1000);

      
      console.info('[' + data.caseTag + '] get Target Component rect before position changed.');
      let initialPosition: RectValue = Utils.getComponentRect(data.pageConfig.componentKey ?? '');

      console.info('[' + data.caseTag + '] setValue : ' + JSON.stringify(data.testValue.setValue));
      AttrsManager.change(data.caseTag, data.testValue.setValue);
      await Utils.sleep(1000);

      
      
      console.info('[' + data.caseTag + '] check markAnchor value.');
      let viewObj: jsonx.JsonElement = Utils.getComponentByKey(data.pageConfig.componentKey ?? '');
      expect(viewObj.getElement('$attrs').getElement('markAnchor').getString('x')).assertEqual(data.testValue.expectValue.x);
      expect(viewObj.getElement('$attrs').getElement('markAnchor').getString('y')).assertEqual(data.testValue.expectValue.y);

      
      console.info('[' + data.caseTag + '] get targetComponent rect after position changed.');
      let targetRectAfter: RectValue = Utils.getComponentRect(data.pageConfig.componentKey ?? '');

      console.info('[' + data.caseTag + '] check actual position.');
      
      
      if ('StringPercent' == data.testValue.describe) {
        
        expect(Math.abs(Number(initialPosition.left - targetRectAfter.left) -
        Number((targetRectAfter.right - targetRectAfter.left) * 0.5)) <= 1).assertTrue();
        expect(Math.abs(Number(initialPosition.top - targetRectAfter.top) -
        Number((targetRectAfter.bottom - targetRectAfter.top) * 0.5)) <= 1).assertTrue();
      } else {
        
        expect(Math.abs(Number(initialPosition.left - targetRectAfter.left) -
        Number(data.testValue.expectValue.left)) <= 1).assertTrue();
        expect(Math.abs(Number(initialPosition.top - targetRectAfter.top) -
        Number(data.testValue.expectValue.top)) <= 1).assertTrue();
      }
    })
  })
}