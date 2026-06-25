/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@system.router';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

interface optionsObj {
  uri: string
}

export default function ChipV2OnClick() {
    describe('ChipV2OnClick', () => {
        beforeAll(async () => {
            console.info("beforeAll case");
        });
        beforeEach(async (done: Function) => {
            console.info("search_caret beforeEach start");
            let options: optionsObj = {
                uri: 'MainAbility/pages/chipV2/ChipV2OnClick',
            }
            try {
                router.clear();
                let pages = router.getState();
                console.info("get ChipV2OnClick state pages: " + JSON.stringify(pages));
                if (!("ChipV2OnClick" == pages.name)) {
                    console.info("get ChipV2OnClick state pages.name: " + JSON.stringify(pages.name));
                    let result = await router.push(options);
                    await CommonFunc.sleep(2000);
                    console.info("push ChipV2OnClick page result: " + JSON.stringify(result));
                }
            } catch (err) {
                console.error("push ChipV2OnClick page error: " + err);
                expect().assertFail();
            }
            done();
        });
        afterEach(async () => {
            console.info("afterEach case");
        });

        afterAll(async () => {
            console.info("afterAll case");
        });

        /**
         * @tc.name   SUB_ARKUI_API_ChipV2OnClick_0100
         * @tc.number SUB_ARKUI_API_ChipV2OnClick_0100
         * @tc.desc   onClicked
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_ARKUI_API_ChipV2OnClick_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('SUB_ARKUI_API_ChipV2OnClick_0100 START');
            let ChipActionCol = CommonFunc.getComponentRect('ChipV2OnClickCol');
            await CommonFunc.sleep(200);
            let left = ChipActionCol.left + vp2px(18);
            let top = ChipActionCol.top + vp2px(18);
            await CommonFunc.sleep(200);
            console.info('SUB_ARKUI_API_ChipV2OnClick_0100 left' + left + 'top:' + top);
            let driver = Driver.create();
            await driver.click(Math.round(left + globalThis.winLeft), Math.round(globalThis.winTop + top));
            await CommonFunc.sleep(1000);
            console.info('SUB_ARKUI_API_ChipV2OnClick_0100 click success');

            let strJson1 = getInspectorByKey('tvChipV2OnClickText');
            let obj2: Record<string, ESObject> = JSON.parse(strJson1);
            await CommonFunc.sleep(1000);
            console.info("[SUB_ARKUI_API_ChipV2OnClick_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
            expect(obj2.$attrs.content).assertEqual('onClicked');
            console.info('[SUB_ARKUI_API_ChipV2OnClick_0100] END');
            done();
        });
    })
}
