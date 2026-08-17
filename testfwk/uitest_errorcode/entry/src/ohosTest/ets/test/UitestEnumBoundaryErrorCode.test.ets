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

import { describe, it, expect, TestType, Level, Size, beforeAll } from '@ohos/hypium';
import {
  ON, MatchPattern, ResizeDirection, DisplayRotation, UiDirection, MouseButton,
  WindowChangeType, ComponentEventType, WindowChangeOptions, ComponentEventOptions,
  Driver, Point, UiWindow, WindowFilter, UIElementInfo, UIEventObserver
} from '@ohos.UiTest';
import { startAbility } from './Utils.test';

const TestTag = 'testTag';
const ErrorCode401 = 401;
const ParameterErrorCode = 17000007;

export default function uitestEnumBoundaryErrorCode() {
  describe('UitestEnumBoundaryErrorCode', () => {
    let driver: Driver;

    beforeAll(async (done: Function) => {
      driver = Driver.create();
      try {
        await driver.delayMs(1000);
      } catch (error) {
      }
      done()
    });

    /**
     * @tc.name   testOnTextMatchPatternNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MATCHPATTERN_0001
     * @tc.desc   ON.text with MatchPattern value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnTextMatchPatternNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.log(`${TestTag}, testOnTextMatchPatternNegative start`);
      try {
        ON.text('test', -1 as MatchPattern);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testOnTextMatchPatternNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testOnTextMatchPatternNegative END`);
    });

    /**
     * @tc.name   testOnDescriptionMatchPatternNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MATCHPATTERN_0003
     * @tc.desc   ON.description with MatchPattern value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnDescriptionMatchPatternNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.log(`${TestTag}, testOnDescriptionMatchPatternNegative start`);
      try {
        ON.description('test', -1 as MatchPattern);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testOnDescriptionMatchPatternNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testOnDescriptionMatchPatternNegative END`);
    });

    /**
     * @tc.name   testOnIdMatchPatternNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MATCHPATTERN_0005
     * @tc.desc   ON.id with MatchPattern value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnIdMatchPatternNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.log(`${TestTag}, testOnIdMatchPatternNegative start`);
      try {
        ON.id('test', -1 as MatchPattern);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testOnIdMatchPatternNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testOnIdMatchPatternNegative END`);
    });

    /**
     * @tc.name   testOnTypeMatchPatternNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MATCHPATTERN_0007
     * @tc.desc   ON.type with MatchPattern value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnTypeMatchPatternNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.log(`${TestTag}, testOnTypeMatchPatternNegative start`);
      try {
        ON.type('test', -1 as MatchPattern);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testOnTypeMatchPatternNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testOnTypeMatchPatternNegative END`);
    });

    /**
     * @tc.name   testOnHintMatchPatternNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MATCHPATTERN_0009
     * @tc.desc   ON.hint with MatchPattern value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnHintMatchPatternNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.log(`${TestTag}, testOnHintMatchPatternNegative start`);
      try {
        ON.hint('test', -1 as MatchPattern);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testOnHintMatchPatternNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testOnHintMatchPatternNegative END`);
    });

    /**
     * @tc.name   testOnOriginalTextMatchPatternNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MATCHPATTERN_0011
     * @tc.desc   ON.originalText with MatchPattern value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOnOriginalTextMatchPatternNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      console.log(`${TestTag}, testOnOriginalTextMatchPatternNegative start`);
      try {
        ON.originalText('test', -1 as MatchPattern);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testOnOriginalTextMatchPatternNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testOnOriginalTextMatchPatternNegative END`);
    });

    /**
     * @tc.name   testDriverSetDisplayRotationNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_DISPROTATION_0001
     * @tc.desc   Driver.setDisplayRotation with value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverSetDisplayRotationNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverSetDisplayRotationNegative start`);
      try {
        await driver.setDisplayRotation(-1 as DisplayRotation);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverSetDisplayRotationNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testDriverSetDisplayRotationNegative END`);
      done()
    });

    /**
     * @tc.name   testDriverFlingUiDirectionNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_UIDIRECTION_0001
     * @tc.desc   Driver.fling with UiDirection value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverFlingUiDirectionNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverFlingUiDirectionNegative start`);
      try {
        await driver.fling(-1 as UiDirection, 600);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverFlingUiDirectionNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testDriverFlingUiDirectionNegative END`);
      done()
    });

    /**
     * @tc.name   testDriverTouchPadMultiFingerSwipeDirectionNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_UIDIRECTION_0003
     * @tc.desc   Driver.touchPadMultiFingerSwipe with UiDirection value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTouchPadMultiFingerSwipeDirectionNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverTouchPadMultiFingerSwipeDirectionNegative start`);
      try {
        await driver.touchPadMultiFingerSwipe(3, -1 as UiDirection);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverTouchPadMultiFingerSwipeDirectionNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testDriverTouchPadMultiFingerSwipeDirectionNegative END`);
      done()
    });

    /**
     * @tc.name   testDriverTouchPadMultiFingerSwipeDirectionAboveMax
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_UIDIRECTION_0004
     * @tc.desc   Driver.touchPadMultiFingerSwipe with UiDirection value 4 (above max 3) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTouchPadMultiFingerSwipeDirectionAboveMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverTouchPadMultiFingerSwipeDirectionAboveMax start`);
      try {
        await driver.touchPadMultiFingerSwipe(3, 4 as UiDirection);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverTouchPadMultiFingerSwipeDirectionAboveMax error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testDriverTouchPadMultiFingerSwipeDirectionAboveMax END`);
      done()
    });

    /**
     * @tc.name   testDriverTouchPadTwoFingersScrollDirectionNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_UIDIRECTION_0005
     * @tc.desc   Driver.touchPadTwoFingersScroll with UiDirection value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTouchPadTwoFingersScrollDirectionNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverTouchPadTwoFingersScrollDirectionNegative start`);
      const point: Point = { x: 100, y: 100 };
      try {
        await driver.touchPadTwoFingersScroll(point, -1 as UiDirection, 1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverTouchPadTwoFingersScrollDirectionNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverTouchPadTwoFingersScrollDirectionNegative END`);
      done()
    });

    /**
     * @tc.name   testDriverTouchPadTwoFingersScrollDirectionAboveMax
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_UIDIRECTION_0006
     * @tc.desc   Driver.touchPadTwoFingersScroll with UiDirection value 4 (above max 3) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverTouchPadTwoFingersScrollDirectionAboveMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverTouchPadTwoFingersScrollDirectionAboveMax start`);
      const point: Point = { x: 100, y: 100 };
      try {
        await driver.touchPadTwoFingersScroll(point, 4 as UiDirection, 1);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverTouchPadTwoFingersScrollDirectionAboveMax error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testDriverTouchPadTwoFingersScrollDirectionAboveMax END`);
      done()
    });

    /**
     * @tc.name   testDriverMouseClickButtonNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MOUSEBUTTON_0001
     * @tc.desc   Driver.mouseClick with MouseButton value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseClickButtonNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverMouseClickButtonNegative start`);
      const point: Point = { x: 100, y: 100 };
      try {
        await driver.mouseClick(point, -1 as MouseButton);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseClickButtonNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testDriverMouseClickButtonNegative END`);
      done()
    });

    /**
     * @tc.name   testDriverMouseDoubleClickButtonNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MOUSEBUTTON_0003
     * @tc.desc   Driver.mouseDoubleClick with MouseButton value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseDoubleClickButtonNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverMouseDoubleClickButtonNegative start`);
      const point: Point = { x: 100, y: 100 };
      try {
        await driver.mouseDoubleClick(point, -1 as MouseButton);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseDoubleClickButtonNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testDriverMouseDoubleClickButtonNegative END`);
      done()
    });

    /**
     * @tc.name   testDriverMouseLongClickButtonNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_MOUSEBUTTON_0005
     * @tc.desc   Driver.mouseLongClick with MouseButton value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDriverMouseLongClickButtonNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testDriverMouseLongClickButtonNegative start`);
      const point: Point = { x: 100, y: 100 };
      try {
        await driver.mouseLongClick(point, -1 as MouseButton);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testDriverMouseLongClickButtonNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testDriverMouseLongClickButtonNegative END`);
      done()
    });

    /**
     * @tc.name   testUiWindowResizeDirectionNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_RESIZEDIR_0001
     * @tc.desc   UiWindow.resize with ResizeDirection value -1 (negative) test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testUiWindowResizeDirectionNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testUiWindowResizeDirectionNegative start`);
      let driver = Driver.create()
      try {
        await startAbility('com.uitestScene.acts', 'com.uitestScene.acts.MainAbility')
        await driver.delayMs(1000)
        let window = await driver.findWindow({bundleName: 'com.uitestScene.acts'})
        await window.resize(100, 100, -1 as ResizeDirection);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testUiWindowResizeDirectionNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode401);
      }
      console.log(`${TestTag}, testUiWindowResizeDirectionNegative END`);
      done()
    });

    /**
     * @tc.name   testObserverOnceWindowChangeTypeNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_WINDOWCHANGE_0001
     * @tc.desc   UIEventObserver.once windowChange with WindowChangeType value -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testObserverOnceWindowChangeTypeNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testObserverOnceWindowChangeTypeNegative start`);
      const observer: UIEventObserver = driver.createUIEventObserver();
      const options: WindowChangeOptions = { timeout: 5000 };
      try {
        observer.once('windowChange', -1 as WindowChangeType, options, (info: UIElementInfo) => {});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testObserverOnceWindowChangeTypeNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testObserverOnceWindowChangeTypeNegative END`);
      done()
    });

    /**
     * @tc.name   testObserverOnceWindowChangeTypeAboveMax
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_WINDOWCHANGE_0002
     * @tc.desc   UIEventObserver.once windowChange with WindowChangeType value 4 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testObserverOnceWindowChangeTypeAboveMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testObserverOnceWindowChangeTypeAboveMax start`);
      const observer: UIEventObserver = driver.createUIEventObserver();
      const options: WindowChangeOptions = { timeout: 5000 };
      try {
        observer.once('windowChange', 4 as WindowChangeType, options, (info: UIElementInfo) => {});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testObserverOnceWindowChangeTypeAboveMax error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testObserverOnceWindowChangeTypeAboveMax END`);
      done()
    });

    /**
     * @tc.name   testObserverOnceComponentEventTypeNegative
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_COMPONENTEVENT_0001
     * @tc.desc   UIEventObserver.once componentEventOccur with ComponentEventType value -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testObserverOnceComponentEventTypeNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testObserverOnceComponentEventTypeNegative start`);
      const observer: UIEventObserver = driver.createUIEventObserver();
      const options: ComponentEventOptions = { timeout: 5000 };
      try {
        observer.once('componentEventOccur', -1 as ComponentEventType, options, (info: UIElementInfo) => {});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testObserverOnceComponentEventTypeNegative error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testObserverOnceComponentEventTypeNegative END`);
      done()
    });

    /**
     * @tc.name   testObserverOnceComponentEventTypeAboveMax
     * @tc.number SUB_testfwk_UITEST_ENUMBOUNDARY_COMPONENTEVENT_0002
     * @tc.desc   UIEventObserver.once componentEventOccur with ComponentEventType value 6 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testObserverOnceComponentEventTypeAboveMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.log(`${TestTag}, testObserverOnceComponentEventTypeAboveMax start`);
      const observer: UIEventObserver = driver.createUIEventObserver();
      const options: ComponentEventOptions = { timeout: 5000 };
      try {
        observer.once('componentEventOccur', 6 as ComponentEventType, options, (info: UIElementInfo) => {});
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testObserverOnceComponentEventTypeAboveMax error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ParameterErrorCode);
      }
      console.log(`${TestTag}, testObserverOnceComponentEventTypeAboveMax END`);
      done()
    });
  });
}