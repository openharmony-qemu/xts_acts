'use static';
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
import Utils, {
  BasePageConfig,
  PageConfig,
  TestValue
} from '../../../ets/MainAbility/common/Utils';
import CommonTest from '../common/CommonTest';
import { describe, expect } from '../../../../hypium/index';

export default function FocusableTest() {

  
  let supportView = [
    'Select',
    'TextPicker',
    'TimePicker',

    // 'Web',


    'SideBarContainer',
  ]

  
  let pageConfig: PageConfig = {
    testName: 'testFocusable',
    pageName: 'FocusablePage',
    pageUrl: 'MainAbility/pages/focusable/FocusablePage',
    referenceComponentKey: 'referenceComponentKey'
  }
  
  let testValues: TestValue[] = [{
    describe: 'SetTrue',
    setValue: true
  }, {
    describe: 'SetFalse',
    setValue: false
  }]

  /**
   * Create test suite.
   */

  describe('FocusableTest', () => {
    CommonTest.initTest(
      pageConfig,
      supportView,
      testValues,
      async (data: BasePageConfig): Promise<void> => {
        let res = Utils.requestFocus(
          data.pageConfig.componentKey ?? ''
        )
        if (
          data.pageConfig.targetView == "TextInput" ||
            data.pageConfig.targetView == "TextArea"
        ) {
          await Utils.sleep(4000)
        } else {
          await Utils.sleep(1000)
        }
        console.info(
          "[" + data.caseTag + "] FocusControlCallback is " + res
        )

        if ("SetTrue" == data.testValue.describe) {
          
          expect(res).assertEqual(true)
          
          let referenceComponent = Utils.getComponentByKey(
            data.pageConfig.referenceComponentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] referenceComponent.getElement('$attrs').getString('label'): " +
            referenceComponent.getElement('$attrs').getString('label')
          )
          expect(referenceComponent.getElement('$attrs').getString('label')).assertContain(
            "onFocus"
          )
          
          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] Focusable is " +
            viewObj.getElement('$attrs').getBoolean('focusable')
          )
          expect(viewObj.getElement('$attrs').getBoolean('focusable')).assertEqual(true)
        } else if ("SetFalse" == data.testValue.describe) {
          
          expect(res).assertEqual(false)
          
          let referenceComponent = Utils.getComponentByKey(
            data.pageConfig.referenceComponentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] referenceComponent.getElement('$attrs').getString('label'): " +
            referenceComponent.getElement('$attrs').getString('label')
          )
          expect(referenceComponent.getElement('$attrs').getString('label')).assertEqual("")
          
          let viewObj = Utils.getComponentByKey(
            data.pageConfig.componentKey ?? ''
          )
          console.info(
            "[" +
            data.caseTag +
              "] Focusable is " +
            viewObj.getElement('$attrs').getBoolean('focusable')
          )
          expect(viewObj.getElement('$attrs').getBoolean('focusable')).assertEqual(false)
        }
      }
    )

  })
}