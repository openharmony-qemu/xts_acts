'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from "@ohos/hypium-static/src/main/indexStatic"
import { Driver, ON } from '@kit.TestKit'
import { startAbility, stopApplication } from './Util.test';

const TestTag = 'uitestTag';
const waitUiReadyMs: int = 1000;

export default function uitestTestApi22(): void {
  describe('uitestTest_Api22', (): void => {
    let driver: Driver | undefined;
    beforeAll(async (): Promise<void> => {
      driver = Driver.create();
      await driver!.delayMs(waitUiReadyMs);
    })

    beforeEach(async (): Promise<void> => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.name tesIsComponentPresentWhenDragTrue_static
     * @tc.number SUB_testfwk_UITEST_ISCOMPONENTPRESENTWHENDRAG_PARAM_0100
     * @tc.desc isComponentPresentWhenDrag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenDragTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let to5Btn = await driver!.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if (to5Btn != null) {
        await to5Btn.click();
      }
      await driver!.delayMs(waitUiReadyMs);
      let dragColCom = await driver!.findComponent(ON.id('dragCol'));
      expect(dragColCom != null).assertTrue();
      if (dragColCom != null) {
        await driver!.delayMs(waitUiReadyMs);
        let center1 = await dragColCom.getBoundsCenter();
        let dragResultTextCom = await driver!.findComponent(ON.id('dragResultText'));
        expect(dragResultTextCom != null).assertTrue();
        if (dragResultTextCom != null) {
          await driver!.delayMs(waitUiReadyMs);
          let center2 = await dragResultTextCom.getBoundsCenter();
          let disId = await dragResultTextCom.getDisplayId();
          let result = await driver!.isComponentPresentWhenDrag(ON.belongingDisplay(disId).text('ShowDragEventText'), center1, center2)
          console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static result, ${JSON.stringify(result)}`);
          expect(result).assertTrue();
        }
      }
      let text = await driver!.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_static end`);
    })

    /**
     * @tc.name tesIsComponentPresentWhenDragTrue_speed_static
     * @tc.number SUB_testfwk_UITEST_ISCOMPONENTPRESENTWHENDRAG_PARAM_0200
     * @tc.desc isComponentPresentWhenDrag test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('tesIsComponentPresentWhenDragTrue_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_speed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let to5Btn = await driver!.findComponent(ON.id('to5'));
      expect(to5Btn != null).assertTrue();
      if (to5Btn != null) {
        await to5Btn.click();
      }
      await driver!.delayMs(waitUiReadyMs);
      let dragColCom = await driver!.findComponent(ON.id('dragCol'));
      expect(dragColCom != null).assertTrue();
      if (dragColCom != null) {
        await driver!.delayMs(waitUiReadyMs);
        let center1 = await dragColCom.getBoundsCenter();
        let dragResultTextCom = await driver!.findComponent(ON.id('dragResultText'));
        expect(dragResultTextCom != null).assertTrue();
        if (dragResultTextCom != null) {
          await driver!.delayMs(waitUiReadyMs);
          let center2 = await dragResultTextCom.getBoundsCenter();
          let disId = await dragResultTextCom.getDisplayId();
          let result = await driver!.isComponentPresentWhenDrag(ON.belongingDisplay(disId).text('ShowDragEventText'), center1, center2, 600);
          console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_speed_static result, ${JSON.stringify(result)}`);
          expect(result).assertTrue();
        }
      }
      let text = await driver!.findComponent(ON.text('drag end'));
      expect(text != null).assertTrue()
      await stopApplication('com.uitestScene.acts')
      console.log(`${TestTag}, tesIsComponentPresentWhenDragTrue_speed_static end`);
    })
  })
}
