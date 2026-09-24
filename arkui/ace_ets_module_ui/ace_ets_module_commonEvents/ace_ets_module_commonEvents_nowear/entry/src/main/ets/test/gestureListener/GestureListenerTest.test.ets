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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, PointerMatrix, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function gestureListenerTest() {
  describe('GestureListenerTest', () => {
    beforeEach(async (done: Function) => {
      console.info('GestureListenerTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/GestureListener/GestureListener',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('GestureListenerPage' == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push GestureListener page success');
        }
      } catch (err) {
        console.error('push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      let driver: Driver = Driver.create();
      try {
        let removeBtn = await driver.findComponent(ON.text('移除全部监听'));
        await removeBtn.click();
        await CommonFunc.sleep(500);
      } catch (e) {
      }
      await CommonFunc.sleep(1000);
      console.info('GestureListenerTest afterEach done');
    });

    /**
     * @tc.name   gestureListener_tap_0100
     * @tc.number SUB_ArkUI_ArkUI_gestureListener_tap_0100
     * @tc.desc   add listener, tap, verify callback triggered; remove, tap, verify not triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureListener_tap_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gestureListener_tap_0100] START');
      let driver: Driver = Driver.create();
      AppStorage.setOrCreate('tapCallback', '')
      let addBtn = await driver.findComponent(ON.text('添加全部监听'))
      await addBtn.click()
      await CommonFunc.sleep(500)
      let tapTarget = await driver.findComponent(ON.id('tapTarget'))
      await tapTarget.click()
      await CommonFunc.sleep(1000)
      let tapResult: string = AppStorage.get<string>('tapCallback') ?? ''
      console.info('[gestureListener_tap_0100] after add: ' + tapResult)
      expect(tapResult === 'triggered').assertTrue()
      let removeBtn = await driver.findComponent(ON.text('移除全部监听'))
      await removeBtn.click()
      await CommonFunc.sleep(500)
      AppStorage.setOrCreate('tapCallback', '')
      await tapTarget.click()
      await CommonFunc.sleep(1000)
      let tapResult2: string = AppStorage.get<string>('tapCallback') ?? ''
      console.info('[gestureListener_tap_0100] after remove: ' + tapResult2)
      expect(tapResult2 === '').assertTrue()
      done();
    });

    /**
     * @tc.name   gestureListener_swipe_0100
     * @tc.number SUB_ArkUI_ArkUI_gestureListener_swipe_0100
     * @tc.desc   add listener, swipe right-to-left, verify callback; remove, verify not triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureListener_swipe_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gestureListener_swipe_0100] START');
      let driver: Driver = Driver.create();
      AppStorage.setOrCreate('swipeCallback', '')
      let addBtn = await driver.findComponent(ON.text('添加全部监听'))
      await addBtn.click()
      await CommonFunc.sleep(500)
      let rect = CommonFunc.getComponentRectOnScreen('swipeTarget')
      let w = rect.right - rect.left
      let h = rect.bottom - rect.top
      let speed = Math.floor(w * 0.6 / 0.016 / 1000) * 1000
      await driver.swipe(
        Math.round(rect.left + w * 0.8), Math.round(rect.top + h / 2),
        Math.round(rect.left + w * 0.2), Math.round(rect.top + h / 2), speed)
      await CommonFunc.sleep(1000)
      let swipeResult: string = AppStorage.get<string>('swipeCallback') ?? ''
      console.info('[gestureListener_swipe_0100] after add: ' + swipeResult)
      expect(swipeResult === 'triggered').assertTrue()
      let removeBtn = await driver.findComponent(ON.text('移除全部监听'))
      await removeBtn.click()
      await CommonFunc.sleep(500)
      AppStorage.setOrCreate('swipeCallback', '')
      await driver.swipe(
        Math.round(rect.left + w * 0.8), Math.round(rect.top + h / 2),
        Math.round(rect.left + w * 0.2), Math.round(rect.top + h / 2), speed)
      await CommonFunc.sleep(1000)
      let swipeResult2: string = AppStorage.get<string>('swipeCallback') ?? ''
      console.info('[gestureListener_swipe_0100] after remove: ' + swipeResult2)
      expect(swipeResult2 === '').assertTrue()
      done();
    });

    /**
     * @tc.name   gestureListener_longpress_0100
     * @tc.number SUB_ArkUI_ArkUI_gestureListener_longpress_0100
     * @tc.desc   add listener, longClick, verify callback; remove, verify not triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureListener_longpress_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gestureListener_longpress_0100] START');
      let driver: Driver = Driver.create();
      AppStorage.setOrCreate('longPressCallback', '')
      let addBtn = await driver.findComponent(ON.text('添加全部监听'))
      await addBtn.click()
      await CommonFunc.sleep(500)
      let rect = CommonFunc.getComponentRectOnScreen('longPressTarget')
      let w = rect.right - rect.left
      let h = rect.bottom - rect.top
      await driver.longClick(Math.round(rect.left + w / 2), Math.round(rect.top + h / 2))
      await CommonFunc.sleep(2000)
      let longPressResult: string = AppStorage.get<string>('longPressCallback') ?? ''
      console.info('[gestureListener_longpress_0100] after add: ' + longPressResult)
      expect(longPressResult === 'triggered').assertTrue()
      let removeBtn = await driver.findComponent(ON.text('移除全部监听'))
      await removeBtn.click()
      await CommonFunc.sleep(500)
      AppStorage.setOrCreate('longPressCallback', '')
      done();
    });

    /**
     * @tc.name   gestureListener_pinch_0100
     * @tc.number SUB_ArkUI_ArkUI_gestureListener_pinch_0100
     * @tc.desc   add listener, pinch via injectMultiPointerAction, verify callback; remove, verify not triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureListener_pinch_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gestureListener_pinch_0100] START');
      let driver: Driver = Driver.create();
      AppStorage.setOrCreate('pinchCallback', '')
      let addBtn = await driver.findComponent(ON.text('添加全部监听'))
      await addBtn.click()
      await CommonFunc.sleep(500)
      let rect = CommonFunc.getComponentRectOnScreen('pinchTarget')
      let w = rect.right - rect.left
      let h = rect.bottom - rect.top
      let pointers: PointerMatrix = PointerMatrix.create(2, 2);
      pointers.setPoint(0, 0, { x: Math.round(rect.left + w * 0.5), y: Math.round(rect.top + h * 0.5) });
      pointers.setPoint(0, 1, { x: Math.round(rect.left + w * 0.7), y: Math.round(rect.top + h * 0.5) });
      pointers.setPoint(1, 0, { x: Math.round(rect.right - w * 0.5), y: Math.round(rect.top + h * 0.5) });
      pointers.setPoint(1, 1, { x: Math.round(rect.right - w * 0.7), y: Math.round(rect.top + h * 0.5) });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(2000)
      let pinchResult: string = AppStorage.get<string>('pinchCallback') ?? ''
      console.info('[gestureListener_pinch_0100] after add: ' + pinchResult)
      expect(pinchResult === 'triggered').assertTrue()
      let removeBtn = await driver.findComponent(ON.text('移除全部监听'))
      await removeBtn.click()
      await CommonFunc.sleep(500)
      AppStorage.setOrCreate('pinchCallback', '')
      done();
    });

    /**
     * @tc.name   gestureListener_rotation_0100
     * @tc.number SUB_ArkUI_ArkUI_gestureListener_rotation_0100
     * @tc.desc   add listener, rotate via injectMultiPointerAction (diagonal cross),
     *            verify callback; remove, verify not triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureListener_rotation_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gestureListener_rotation_0100] START');
      let driver: Driver = Driver.create();
      AppStorage.setOrCreate('rotationCallback', '')
      let addBtn = await driver.findComponent(ON.text('添加全部监听'))
      await addBtn.click()
      await CommonFunc.sleep(500)
      let rect = CommonFunc.getComponentRectOnScreen('rotationTarget')
      let w = rect.right - rect.left
      let h = rect.bottom - rect.top
      let cx = Math.round(rect.left + w / 2)
      let cy = Math.round(rect.top + h / 2)
      let r = Math.round(Math.min(w, h) * 0.2)
      let pointers: PointerMatrix = PointerMatrix.create(2, 2);
      pointers.setPoint(0, 0, { x: cx, y: cy - r });
      pointers.setPoint(0, 1, { x: cx + r, y: cy });
      pointers.setPoint(1, 0, { x: cx, y: cy + r });
      pointers.setPoint(1, 1, { x: cx - r, y: cy });
      await driver.injectMultiPointerAction(pointers);
      await CommonFunc.sleep(2000)
      let rotationResult: string = AppStorage.get<string>('rotationCallback') ?? ''
      console.info('[gestureListener_rotation_0100] after add: ' + rotationResult)
      expect(rotationResult === 'triggered').assertTrue()
      let removeBtn = await driver.findComponent(ON.text('移除全部监听'))
      await removeBtn.click()
      await CommonFunc.sleep(500)
      AppStorage.setOrCreate('rotationCallback', '')
      done();
    });

    /**
     * @tc.name   gestureListener_pan_0100
     * @tc.number SUB_ArkUI_ArkUI_gestureListener_pan_0100
     * @tc.desc   add listener, pan via swipe right-to-left, verify callback; remove, verify not triggered
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('gestureListener_pan_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[gestureListener_pan_0100] START');
      let driver: Driver = Driver.create();
      AppStorage.setOrCreate('panCallback', '')
      let addBtn = await driver.findComponent(ON.text('添加全部监听'))
      await addBtn.click()
      await CommonFunc.sleep(500)
      let rect = CommonFunc.getComponentRectOnScreen('panTarget')
      let w = rect.right - rect.left
      let h = rect.bottom - rect.top
      let speed = Math.floor(w * 0.6 / 0.016 / 1000) * 1000
      await driver.swipe(
        Math.round(rect.left + w * 0.8), Math.round(rect.top + h / 2),
        Math.round(rect.left + w * 0.2), Math.round(rect.top + h / 2), speed)
      await CommonFunc.sleep(1000)
      let panResult: string = AppStorage.get<string>('panCallback') ?? ''
      console.info('[gestureListener_pan_0100] after add: ' + panResult)
      expect(panResult === 'triggered').assertTrue()
      let removeBtn = await driver.findComponent(ON.text('移除全部监听'))
      await removeBtn.click()
      await CommonFunc.sleep(2000)
      AppStorage.setOrCreate('panCallback', '')
      await driver.swipe(
        Math.round(rect.left + w * 0.8), Math.round(rect.top + h / 2),
        Math.round(rect.left + w * 0.2), Math.round(rect.top + h / 2), speed)
      await CommonFunc.sleep(1000)
      let panResult2: string = AppStorage.get<string>('panCallback') ?? ''
      console.info('[gestureListener_pan_0100] after remove: ' + panResult2)
      expect(panResult2 === '').assertTrue()
      done();
    });
  });
}
