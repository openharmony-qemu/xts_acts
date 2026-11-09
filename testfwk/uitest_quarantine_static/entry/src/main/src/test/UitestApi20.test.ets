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
import { Driver, ON, DisplayRotation, MouseButton } from '@kit.TestKit'
import hilog from '@ohos.hilog'
import display from '@ohos.display';
import { Utils, startAbility, stopApplication } from './Util.test';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'uitestTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
const waitUiReadyMs: int = 1000;

export default function uitestTestApi20(): void {
  describe('uitestTest_Api20', (): void => {
    let driver: Driver | undefined;
    beforeAll(async (): Promise<void> => {
      hilog.info(domain, tag, "uitestTest_Api20 loadup start!!!!!");
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      driver = Driver.create();
      await Utils.msSleep(1000);
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, "uitestTest_Api20 loadup over!!!!!");
    })

    beforeEach(async (): Promise<void> => {
      await stopApplication('com.uitestScene.acts');
    })

    /**
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_API20_PARAM_0100
     * @tc.name testDragBetween_static
     * @tc.desc drag this UiComponent to the bounds rect of target UiComponent, the value of duration is 3000, the value of speed is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDragBetween_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragBetween_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let center1 = await text1.getBoundsCenter();
        let center2 = await text2.getBoundsCenter();
        await driver!.dragBetween(center1, center2);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDragBetween_static end`);
    })

    /**
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_API20_PARAM_0200
     * @tc.name testDragBetween_speed_static
     * @tc.desc drag this UiComponent to the bounds rect of target UiComponent, the value of duration is 3000, the value of speed is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDragBetween_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragBetween_speed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let center1 = await text1.getBoundsCenter();
        let center2 = await text2.getBoundsCenter();
        await driver!.dragBetween(center1, center2, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDragBetween_speed_static end`);
    })

    /**
     * @tc.number SUB_testfwk_UITEST_DRAGBETWEEN_API20_PARAM_0300
     * @tc.name testDragBetween_duration_static
     * @tc.desc drag this UiComponent to the bounds rect of target UiComponent, the value of duration is 3000, the value of speed is 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDragBetween_duration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      hilog.info(domain, tag, `testDragBetween_duration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        await button.longClick();
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let center1 = await text1.getBoundsCenter();
        let center2 = await text2.getBoundsCenter();
        await driver!.dragBetween(center1, center2, 3000, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testDragBetween_duration_static end`);
    })

    /**
     * @tc.number SUB_testfwk_UITEST_GETDISPLAYROTATION_API20_PARAM_0100
     * @tc.name testGetDisplayRotationWithId_static
     * @tc.desc getDisplayRotation test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetDisplayRotationWithId_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (): Promise<void> => {
      let disArray = await display.getAllDisplays()
      if (disArray != null) {
        let disLength = disArray.length;
        if (disLength == 1) { // 此用例不支持在多屏上执行
          hilog.info(domain, tag, `testGetDisplayRotationWithId_static start`);
          await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
          await driver!.delayMs(waitUiReadyMs);
          let disPlay = display.getDefaultDisplaySync();
          await driver!.setDisplayRotation(DisplayRotation.ROTATION_0);
          await driver!.delayMs(waitUiReadyMs);
          let rotation = await driver!.getDisplayRotation(disPlay.id.toInt());
          if (rotation == DisplayRotation.ROTATION_90) {
            console.info('The device is displayed in horizontal on default');
            await driver!.setDisplayRotation(DisplayRotation.ROTATION_90);
            await driver!.delayMs(waitUiReadyMs);
            let rotation1 = await driver!.getDisplayRotation(disPlay.id.toInt());
            expect(rotation1 == DisplayRotation.ROTATION_0).assertTrue();

            await driver!.setDisplayRotation(DisplayRotation.ROTATION_180);
            await driver!.delayMs(waitUiReadyMs);
            let rotation2 = await driver!.getDisplayRotation(disPlay.id.toInt());
            expect(rotation2 == DisplayRotation.ROTATION_270).assertTrue();

            await driver!.setDisplayRotation(DisplayRotation.ROTATION_270);
            await driver!.delayMs(waitUiReadyMs);
            let rotation3 = await driver!.getDisplayRotation(disPlay.id.toInt());
            expect(rotation3 == DisplayRotation.ROTATION_180).assertTrue();

            await driver!.setDisplayRotation(DisplayRotation.ROTATION_90);
          } else if (rotation == DisplayRotation.ROTATION_0) {
            console.info('The device is displayed in vertical on default');
            await driver!.setDisplayRotation(DisplayRotation.ROTATION_90);
            await driver!.delayMs(waitUiReadyMs)
            let rotation1 = await driver!.getDisplayRotation(disPlay.id.toInt());
            expect(rotation1 == DisplayRotation.ROTATION_90).assertTrue();

            await driver!.setDisplayRotation(DisplayRotation.ROTATION_180);
            await driver!.delayMs(waitUiReadyMs);
            let rotation2 = await driver!.getDisplayRotation(disPlay.id.toInt());
            expect(rotation2 == DisplayRotation.ROTATION_180).assertTrue();

            await driver!.setDisplayRotation(DisplayRotation.ROTATION_270);
            await driver!.delayMs(waitUiReadyMs);
            let rotation3 = await driver!.getDisplayRotation(disPlay.id.toInt());
            expect(rotation3 == DisplayRotation.ROTATION_270).assertTrue();

            await driver!.setDisplayRotation(DisplayRotation.ROTATION_0);
            await driver!.delayMs(waitUiReadyMs);
          }
          await stopApplication('com.uitestScene.acts');
          hilog.info(domain, tag, `testGetDisplayRotationWithId_static end`);
        }
      }
    })

    /**
     * @tc.name testNewMouseDrag_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_API20_PARAM_0100
     * @tc.desc drag on the screen between the specified points by mouse, the value of speed and duration are 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewMouseDrag_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testNewMouseDrag_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 2072, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter();
        let point2 = await text2.getBoundsCenter();
        await driver!.mouseDrag(point1, point2);
      }
      await driver!.delayMs(2000);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testNewMouseDrag_static end`);
    })

    /**
     * @tc.name testNewMouseDrag_speed_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_API20_PARAM_0200
     * @tc.desc drag on the screen between the specified points by mouse, the value of speed and duration are 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewMouseDrag_speed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testNewMouseDrag_speed_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 2072, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter();
        let point2 = await text2.getBoundsCenter();
        await driver!.mouseDrag(point1, point2, 600);
      }
      await driver!.delayMs(2000);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testNewMouseDrag_speed_static end`);
    })

    /**
     * @tc.name testNewMouseDrag_duration_static
     * @tc.number SUB_testfwk_UITEST_MOUSEDRAG_API20_PARAM_0300
     * @tc.desc drag on the screen between the specified points by mouse, the value of speed and duration are 3000.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testNewMouseDrag_duration_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      hilog.info(domain, tag, `testNewMouseDrag_duration_static start`);
      await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility');
      await driver!.delayMs(waitUiReadyMs);
      let button = await driver!.findComponent(ON.id('jump'));
      expect(button != null).assertTrue();
      if (button != null) {
        let center = await button.getBoundsCenter();
        await driver!.mouseLongClick(center, MouseButton.MOUSE_BUTTON_LEFT, 0, 2072, 3000);
      }
      await driver!.delayMs(waitUiReadyMs);
      let text1 = await driver!.findComponent(ON.text('one'));
      let text2 = await driver!.findComponent(ON.text('two'));
      expect(text1 != null).assertTrue();
      expect(text2 != null).assertTrue();
      if (text1 != null && text2 != null) {
        let point1 = await text1.getBoundsCenter();
        let point2 = await text2.getBoundsCenter();
        await driver!.mouseDrag(point1, point2, 600, 3000);
      }
      await driver!.delayMs(2000);
      let text = await driver!.findComponent(ON.text('one').isBefore(ON.text('two')));
      expect(text == null).assertTrue();
      await stopApplication('com.uitestScene.acts');
      hilog.info(domain, tag, `testNewMouseDrag_duration_static end`);
    })
  })
}
