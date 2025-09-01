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
import Utils, { BasePageConfig, PageConfig, TestValue, RectValue } from '../../../ets/MainAbility/common/Utils';
import CommonTest, { CallbackWithReturn } from '../common/CommonTest';
import CommonTest from "../common/CommonTest"
import { describe, beforeAll, expect } from "../../../../hypium/index"
import { focusControl } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;




export default function GroupDefaultFocusTest() {

    let supportView:Array<string> = new Array<string>("Button",
        "TextArea",
        "Search",
        "Text",
        "Image",
        "Grid",
        "List",
        "Checkbox",
        "CheckboxGroup",
        "Menu",
        "MenuItem",
        "Radio",
        "Rating",
        "Slider",
        "Toggle",
        "AlphabetIndexer",
        "Column",
        "Counter",
        "Flex",
        "GridItem",
        "ListItem",
        "Scroll",
        "Stack",
        "Swiper",
        "Tabs")


    let pageConfig: PageConfig = {
        testName: "testGroupDefaultFocus",
        pageName: "GroupDefaultFocusPage",
        pageUrl: "MainAbility/pages/groupDefaultFocus/GroupDefaultFocusPage",
        textComponentKey: "textComponentKey",
        referenceOneComponentKey: "referenceOneComponentKey",
        referenceTwoComponentKey: "referenceTwoComponentKey",
        sharePage: false,
    }

    let testValues: TestValue[] = [
        {
            describe: "SetTrue",
            setValue: true,
        },
        {
            describe: "SetFalse",
            setValue: false,
        },
    ]

    /**
     * Create test suite.
     */

    describe("GroupDefaultFocusTest", () => {
        beforeAll(() => {
            console.info("GroupDefaultFocusTest beforeEach start");

            await UtilsTest.msSleep(4000)
            await UtilsTest.startAbility("工程bundleName", "EntryAbility")
            await UtilsTest.msSleep(4000)

        });

        CommonTest.initTest(
            pageConfig,
            supportView,
            testValues,
            async (data: BasePageConfig): Promise<void> => {

                let requestFocusText = focusControl.requestFocus(
                    data.pageConfig.referenceOneComponentKey
                )
                expect(requestFocusText).assertEqual(true)
                if (data.pageConfig.targetView == "TextArea") {
                    await Utils.sleep(4000)
                } else {
                    await Utils.sleep(1000)
                }

                let tab = Utils.performKeyEventDownUp(2049, "Tab")
                expect(tab).assertEqual(true)
                if (data.pageConfig.targetView == "TextArea") {
                    await Utils.sleep(4000)
                } else {
                    await Utils.sleep(1000)
                }

                if ("SetTrue" == data.testValue.describe) {

                    let textComponent: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.textComponentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] textComponent.getElement('$attrs').getString('content') is " +
                        textComponent.getElement('$attrs').getString('content')
                    )
                    expect(textComponent.getElement('$attrs').getString('content')).assertContain(
                        "onFocus"
                    )


                    let viewObj: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.componentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] groupDefaultFocus is " +
                        viewObj.getElement('$attrs').getString('groupDefaultFocus')
                    )
                    expect(viewObj.getElement('$attrs').getString('groupDefaultFocus')).assertEqual(true)


                    let secondFocus = focusControl.requestFocus(
                        data.pageConfig.referenceOneComponentKey
                    )
                    await Utils.sleep(1000)
                    expect(secondFocus).assertEqual(true)


                    let secondTab = Utils.performKeyEventDownUp(2049, "Tab")
                    expect(secondTab).assertEqual(true)
                    await Utils.sleep(1000)


                    let textComponentTwo: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.textComponentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] textComponentTwo.getElement('$attrs').getString('content'): " +
                        textComponentTwo.getElement('$attrs').getString('content')
                    )
                    expect(textComponentTwo.getElement('$attrs').getString('content')).assertEqual(
                        "onFocus"
                    )
                } else if ("SetFalse" == data.testValue.describe) {

                    let textComponent: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.textComponentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] textComponent.getElement('$attrs').getString('content'): " +
                        textComponent.getElement('$attrs').getString('content')
                    )
                    expect(textComponent.getElement('$attrs').getString('content')).assertEqual("")


                    let viewObj: jsonx.JsonElement = Utils.getComponentByKey(
                        data.pageConfig.componentKey
                    )
                    console.info(
                        "[" +
                        data.caseTag +
                            "] viewObj.getElement('$attrs').getString('groupDefaultFocus'):" +
                        viewObj.getElement('$attrs').getString('groupDefaultFocus')
                    )
                    expect(viewObj.getElement('$attrs').getString('groupDefaultFocus')).assertEqual(false)
                }
            }
        )
    })
}
