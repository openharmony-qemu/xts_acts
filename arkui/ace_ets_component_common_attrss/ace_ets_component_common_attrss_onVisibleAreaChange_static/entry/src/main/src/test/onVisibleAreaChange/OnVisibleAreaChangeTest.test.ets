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
import {vp2px,Color} from '@ohos.arkui.component'
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
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function onVisibleAreaChangeTest() {

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
    'MenuItem',
    'MenuItemGroup',
    'Navigation',
    'NavRouter',

    'PatternLock',
    'Progress',
    'QRCode',
    'Radio',
    'Rating',
    'RichText',
    'ScrollBar',
    'Search'
  )

  //Custom params.
  let compareTextKey = 'compareTextKey';
  let compareTextWidth = 100;
  let compareTextHeight = 50;
  let componentWidth = 100;
  let componentHeight = 100;
  let scrollWidth = 300;
  let scrollHeight = 400;
  let columnWidth = 200;
  let columnHeight = 800;
  let buttonWidth = 100;
  let buttonHeight = 100;

  let pageConfig: PageConfig = {
    testName: 'testOnVisibleAreaChange',
    pageName: 'OnVisibleAreaChangePage',
    pageUrl: 'MainAbility/pages/onVisibleAreaChange/OnVisibleAreaChangePage',
    targetGroupView: 'targetGroupView',
    compareTextKey: compareTextKey,
    compareTextWidth: compareTextWidth,
    compareTextHeight: compareTextHeight,
    scrollWidth: scrollWidth,
    scrollHeight: scrollHeight,
    columnWidth: columnWidth,
    columnHeight: columnHeight,
    buttonWidth: buttonWidth,
    buttonHeight: buttonHeight,
    componentWidth: componentWidth,
    componentHeight: componentHeight
  }

  //Test content and expected results
  let testValues: TestValue[] = [
  //    {
  //    describe: 'Normal',
  //    setValue: {
  //      leave: {
  //        yOffSetValueLeave: 200,
  //        ratiosLeft: 0.2,
  //        ratiosRight: 0.8
  //      },
  //      enter: {
  //        yOffSetValueEnter: 0
  //      }
  //    },
  //    expectValue: {
  //      yOffSetMoveLength: 200
  //    }
  //  },
    {
      describe: 'Abnormal',
      setValue: {
        leave: {
          yOffSetValueLeave: 200,
          ratiosLeft: -0.5,
          ratiosRight: 1.5
        },
        enter: {
          yOffSetValueEnter: 0
        }
      },
      expectValue: {
        yOffSetMoveLength: 200
      }
    }]

  describe('OnVisibleAreaChangeTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.acts.arkui.component.common.attrs.test.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
CommonTest.initTest(pageConfig, supportView, testValues, async (data: BasePageConfig): Promise<void> => {
      //Get Information about the location of the target component before the change
      let targetRectBefore: RectValue = Utils.getComponentRect(data.pageConfig.componentKey??'');
      console.info('[' + data.caseTag + '] targetRectBefore: ' + targetRectBefore);

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue.leave);
      await Utils.sleep(1000);
      inspector.sendEventByKey('OnVisibleAreaChangeButton', 10, '');
      await Utils.sleep(4000);

      //Gets information about where the target component moved out
      let targetRectLeave: RectValue = Utils.getComponentRect(data.pageConfig.componentKey??'');
      console.info('[' + data.caseTag + '] targetRectLeave: ' + targetRectLeave);
      let compareTextLeave: StrJsonObj = Utils.getComponentByKey(data.pageConfig.compareTextKey??'');

      //Set value
      AttrsManager.change(data.caseTag, data.testValue.setValue.enter);
      await Utils.sleep(1000);
      inspector.sendEventByKey('OnVisibleAreaChangeButton', 10, '');
      await Utils.sleep(4000);

      //Gets information about where the target component enters
      let targetRectEnter: RectValue = Utils.getComponentRect(data.pageConfig.componentKey??'');
      console.info('[' + data.caseTag + '] targetRectEnter: ' + targetRectEnter);
      let compareTextEnter: StrJsonObj = Utils.getComponentByKey(data.pageConfig.compareTextKey??'');

      //Check that the target component has moved the correct distance
      console.info('[' + data.caseTag + '] targetRectBefore.bottom: ' + targetRectBefore.bottom);
      console.info('[' + data.caseTag + '] targetRectLeave.bottom: ' + targetRectLeave.bottom);
      console.info('[' + data.caseTag + '] targetRectEnter.bottom: ' + targetRectEnter.bottom);
      expect(Math.abs((targetRectBefore.bottom - targetRectLeave.bottom) - vp2px(data.testValue.expectValue.yOffSetMoveLength)) <= 1).assertTrue();
      expect(Math.abs(((targetRectEnter.bottom - targetRectLeave.bottom)) - vp2px(data.testValue.expectValue.yOffSetMoveLength)) <= 1).assertTrue();
      let ratiosRightNum: number = data.testValue.setValue.leave.ratiosRight as number;
      let ratiosLeftNum: number = data.testValue.setValue.leave.ratiosLeft as number;

      //Check whether a callback is triggered and whether it contains data
      console.info('[' + data.caseTag + '] compareTextLeave.$attrs.content: ' +
      compareTextLeave.$attrs.content);
      let compareTextLeaveStr: string = compareTextLeave.$attrs.content;
      if (compareTextLeaveStr.indexOf('@') >= 0 && compareTextLeaveStr.indexOf('{') < 0) {
        expect('null').assertEqual('objects');
      }

      //Loop to check that each set of data is correct
      let compareTextLeaveObj: string[] = compareTextLeaveStr.split('@');
      if (data.testValue.describe == 'Normal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkNormalLeaveResults(data, compareTextLeaveObj, ratiosRightNum);
      } else if (data.testValue.describe == 'Abnormal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkAbnormalResults(data, compareTextLeaveObj);
      } else {
        console.info('[' + data.caseTag + '] data.testValue.describe is error:' + data.testValue.describe);
      }

      //Check whether a callback is triggered and whether it contains data
      console.info('[' + data.caseTag + '] compareTextEnter.$attrs.content: ' + compareTextEnter.$attrs.content);
      let compareTextEnterStr: string = compareTextEnter.$attrs.content;
      if (compareTextEnterStr.indexOf('@') >= 0 && compareTextEnterStr.indexOf('{') < 0) {
        expect('null').assertEqual('objects');
      }

      //Loop to check that each set of data is correct
      let compareTextEnterObj: string[] = compareTextEnterStr.split('@');
      if (data.testValue.describe == 'Normal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkNormalEnterResults(data, compareTextEnterObj, ratiosLeftNum);
      } else if (data.testValue.describe == 'Abnormal') {
        console.info('[' + data.caseTag + '] data.testValue.describe:' + data.testValue.describe);
        await checkAbnormalResults(data, compareTextEnterObj);
      } else {
        console.info('[' + data.caseTag + '] data.testValue.describe is error:' + data.testValue.describe);
        expect('data.testValue.describe').assertEqual('error');
      }
    });
  })
}

async function checkNormalLeaveResults(data: BasePageConfig, compareTextObj: string[], ratiosRightNum: number) {
  console.info('[' + data.caseTag + '] checkNormalLeaveResults');
  for (let num: number = 0; num <= compareTextObj.length; num++) {
    if (compareTextObj[num]) {
      console.info('[' + data.caseTag + '] compareTextObj[' + num + ']:' + compareTextObj[num]);
      let compareText: CurrentRatio = JSON.parse<Object>(compareTextObj[num],Type.of(new String() as Object)) as CurrentRatio
      console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).currentRatio:' +
      compareText.currentRatio);
      console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).isVisible:' +
      compareText.isVisible);
      if (compareText.currentRatio > ratiosRightNum) {
        expect(compareText.isVisible).assertEqual('true');
      } else if (compareText.currentRatio < ratiosRightNum) {
        expect(compareText.isVisible).assertEqual('false');
      } else {
        console.info('[' + data.caseTag + '] Leave currentRatio is error:' +
        compareText.currentRatio);
      }
    }
  }
}

async function checkNormalEnterResults(data: BasePageConfig, compareTextObj: string[], ratiosLeftNum: number) {
  console.info('[' + data.caseTag + '] checkNormalEnterResults');
  for (let num: number = 0; num <= compareTextObj.length; num++) {
    if (compareTextObj[num]) {
      let compareText: CurrentRatio = JSON.parse<Object>(compareTextObj[num],Type.of(new String() as Object)) as CurrentRatio
      console.info('[' + data.caseTag + '] compareTextObj[' + num + ']:' + compareTextObj[num]);
      console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).currentRatio:' +
      compareText.currentRatio);
      console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).isVisible:' +
      compareText.isVisible);
      if (compareText.currentRatio > ratiosLeftNum) {
        expect(compareText.isVisible).assertEqual('true');
      } else if (compareText.currentRatio < ratiosLeftNum) {
        expect(compareText.isVisible).assertEqual('false');
      } else {
        console.info('[' + data.caseTag + '] Enter currentRatio is error:' +
        compareText.currentRatio);
      }
    }
  }
}

async function checkAbnormalResults(data: BasePageConfig, compareTextObj: string[]) {
  console.info('[' + data.caseTag + '] checkAbnormalResults');
  for (let num: number = 0; num <= compareTextObj.length; num++) {
    if (compareTextObj[num]) {
      let compareText: CurrentRatio = JSON.parse<Object>(compareTextObj[num],Type.of(new String() as Object)) as CurrentRatio
      console.info('[' + data.caseTag + '] compareTextObj[' + num + ']:' + compareTextObj[num]);
      console.info('[' + data.caseTag + '] JSON.parse(compareTextObj[num]).currentRatio:' +
      compareText.currentRatio);
      expect((compareText.currentRatio >= 0) && (compareText.currentRatio <= 1)).assertEqual(true);
    }
  }
}