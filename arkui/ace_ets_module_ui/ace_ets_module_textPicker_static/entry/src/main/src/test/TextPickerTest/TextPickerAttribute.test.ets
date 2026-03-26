/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static';

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import {
  Color,
  BlurStyle,
  DialogAlignment,
  HoverModeAreaType,
  PickerBackgroundStyle,
  TextPickerTextStyle,
  TextPickerDialogOptionsExt,
  PickerDialogButtonStyle,
  Rectangle,
  Offset,
  ShadowOptions,
  BackgroundBlurStyleOptions,
  BackgroundEffectOptions
} from '@ohos.arkui.component';
import { LengthMetrics } from '@ohos.arkui.node';

const SLEEP_TIME = 1000;

export default function TextPickerAttributeTest() {
  describe('TextPickerAttributeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('TextPickerAttributeTest beforeAll start');
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility('com.arkui.ace.textPicker.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('TextPickerAttributeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/TextPickerAttributeIndex',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('TextPickerAttributeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'TextPickerAttributeIndex') {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error('TextPickerAttributeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await Utils.sleep(200);
    });

    // ============================================================
    // PickerBackgroundStyle.color
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_001
     * @tc.name pickerBackgroundStyleColor
     * @tc.desc Test PickerBackgroundStyle.color property
     */
    it('pickerBackgroundStyleColor', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleColor START');
      let style: PickerBackgroundStyle = { color: Color.Blue };
      expect(style.color !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_002
     * @tc.name pickerBackgroundStyleColorUndefined
     * @tc.desc Test PickerBackgroundStyle.color with undefined
     */
    it('pickerBackgroundStyleColorUndefined', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleColorUndefined START');
      let style: PickerBackgroundStyle = {};
      expect(style.color === undefined).assertTrue();
      done();
    });

    // ============================================================
    // PickerBackgroundStyle.borderRadius
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_003
     * @tc.name pickerBackgroundStyleBorderRadius
     * @tc.desc Test PickerBackgroundStyle.borderRadius property accepts LengthMetrics value
     */
    it('pickerBackgroundStyleBorderRadius', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleBorderRadius START');
      // borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses
      let style: PickerBackgroundStyle = { borderRadius: LengthMetrics.vp(8) };
      expect(style.borderRadius !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_004
     * @tc.name pickerBackgroundStyleBorderRadiusUndefined
     * @tc.desc Test PickerBackgroundStyle.borderRadius with undefined
     */
    it('pickerBackgroundStyleBorderRadiusUndefined', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: pickerBackgroundStyleBorderRadiusUndefined START');
      let style: PickerBackgroundStyle = {};
      expect(style.borderRadius === undefined).assertTrue();
      done();
    });

    // ============================================================
    // TextPickerAttribute.selectedBackgroundStyle (UI tests)
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_005
     * @tc.name textPickerSelectedBgStyleBlue
     * @tc.desc Test TextPickerAttribute.selectedBackgroundStyle with color
     */
    it('textPickerSelectedBgStyleBlue', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerAttributeTest execute: textPickerSelectedBgStyleBlue START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textPickerSelectedBgStyleBlue'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextPickerAttributeTest execute: textPickerSelectedBgStyleBlue error:' + error);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number TextPickerAttributeTest_006
     * @tc.name textPickerSelectedBgStyleUndefined
     * @tc.desc Test TextPickerAttribute.selectedBackgroundStyle with undefined
     */
    it('textPickerSelectedBgStyleUndefined', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('TextPickerAttributeTest execute: textPickerSelectedBgStyleUndefined START');
      try {
        await CommonFunc.sleep(SLEEP_TIME);
        let node = JSON.parseJsonElement(inspector.getInspectorByKey('textPickerSelectedBgStyleUndefined'));
        expect(node !== null).assertTrue();
        done();
      } catch (error) {
        console.error('TextPickerAttributeTest execute: textPickerSelectedBgStyleUndefined error:' + error);
        expect().assertFail();
        done();
      }
    });

    // ============================================================
    // TextPickerDialogOptionsExt properties (pure JS)
    // ============================================================

    /**
     * @tc.number TextPickerAttributeTest_007
     * @tc.name textPickerDialogDefaultPickerItemHeight
     * @tc.desc Test TextPickerDialogOptionsExt.defaultPickerItemHeight property
     */
    it('textPickerDialogDefaultPickerItemHeight', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDefaultPickerItemHeight START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], defaultPickerItemHeight: 44 };
      expect(opts.defaultPickerItemHeight !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_008
     * @tc.name textPickerDialogCanLoop
     * @tc.desc Test TextPickerDialogOptionsExt.canLoop property
     */
    it('textPickerDialogCanLoop', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogCanLoop START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], canLoop: true };
      expect(opts.canLoop).assertEqual(true);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_009
     * @tc.name textPickerDialogDisappearTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.disappearTextStyle property
     */
    it('textPickerDialogDisappearTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDisappearTextStyle START');
      let style: TextPickerTextStyle = { color: Color.Gray };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], disappearTextStyle: style };
      expect(opts.disappearTextStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_010
     * @tc.name textPickerDialogTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.textStyle property
     */
    it('textPickerDialogTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogTextStyle START');
      let style: TextPickerTextStyle = { color: Color.Black };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], textStyle: style };
      expect(opts.textStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_011
     * @tc.name textPickerDialogAcceptButtonStyle
     * @tc.desc Test TextPickerDialogOptionsExt.acceptButtonStyle property
     */
    it('textPickerDialogAcceptButtonStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogAcceptButtonStyle START');
      // PickerDialogButtonStyle: all properties are optional; use empty object to avoid enum type issues
      let btnStyle: PickerDialogButtonStyle = {};
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], acceptButtonStyle: btnStyle };
      expect(opts.acceptButtonStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_012
     * @tc.name textPickerDialogCancelButtonStyle
     * @tc.desc Test TextPickerDialogOptionsExt.cancelButtonStyle property
     */
    it('textPickerDialogCancelButtonStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogCancelButtonStyle START');
      let btnStyle: PickerDialogButtonStyle = {};
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], cancelButtonStyle: btnStyle };
      expect(opts.cancelButtonStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_013
     * @tc.name textPickerDialogSelectedTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.selectedTextStyle property
     */
    it('textPickerDialogSelectedTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogSelectedTextStyle START');
      let style: TextPickerTextStyle = { color: Color.Blue };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], selectedTextStyle: style };
      expect(opts.selectedTextStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_014
     * @tc.name textPickerDialogDisableTextStyleAnimation
     * @tc.desc Test TextPickerDialogOptionsExt.disableTextStyleAnimation property
     */
    it('textPickerDialogDisableTextStyleAnimation', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDisableTextStyleAnimation START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], disableTextStyleAnimation: false };
      expect(opts.disableTextStyleAnimation).assertEqual(false);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_015
     * @tc.name textPickerDialogDefaultTextStyle
     * @tc.desc Test TextPickerDialogOptionsExt.defaultTextStyle property
     */
    it('textPickerDialogDefaultTextStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogDefaultTextStyle START');
      let style: TextPickerTextStyle = { color: Color.White };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], defaultTextStyle: style };
      expect(opts.defaultTextStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_016
     * @tc.name textPickerDialogMaskRect
     * @tc.desc Test TextPickerDialogOptionsExt.maskRect property (Rectangle)
     */
    it('textPickerDialogMaskRect', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogMaskRect START');
      let rect: Rectangle = { x: 0, y: 0, width: 300, height: 200 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], maskRect: rect };
      expect(opts.maskRect !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_017
     * @tc.name textPickerDialogAlignment
     * @tc.desc Test TextPickerDialogOptionsExt.alignment property (DialogAlignment enum)
     */
    it('textPickerDialogAlignment', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogAlignment START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], alignment: DialogAlignment.Center };
      expect(opts.alignment !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_018
     * @tc.name textPickerDialogOffset
     * @tc.desc Test TextPickerDialogOptionsExt.offset property (Offset with required dx, dy)
     */
    it('textPickerDialogOffset', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogOffset START');
      // Offset.dx and Offset.dy are both required (Length = string | double | Resource)
      let offset: Offset = { dx: 10, dy: 10 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], offset: offset };
      expect(opts.offset !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_019
     * @tc.name textPickerDialogBackgroundColor
     * @tc.desc Test TextPickerDialogOptionsExt.backgroundColor property
     */
    it('textPickerDialogBackgroundColor', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogBackgroundColor START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], backgroundColor: Color.White };
      expect(opts.backgroundColor !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_020
     * @tc.name textPickerDialogBackgroundBlurStyle
     * @tc.desc Test TextPickerDialogOptionsExt.backgroundBlurStyle property (BlurStyle enum)
     */
    it('textPickerDialogBackgroundBlurStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogBackgroundBlurStyle START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], backgroundBlurStyle: BlurStyle.Regular };
      expect(opts.backgroundBlurStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_021
     * @tc.name textPickerDialogBackgroundBlurStyleOptions
     * @tc.desc Test TextPickerDialogOptionsExt.backgroundBlurStyleOptions property (BackgroundBlurStyleOptions)
     */
    it('textPickerDialogBackgroundBlurStyleOptions', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogBackgroundBlurStyleOptions START');
      // BackgroundBlurStyleOptions: colorMode/adaptiveColor are enum-typed, use empty object
      let blurOpts: BackgroundBlurStyleOptions = {};
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], backgroundBlurStyleOptions: blurOpts };
      expect(opts.backgroundBlurStyleOptions !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_022
     * @tc.name textPickerDialogBackgroundEffect
     * @tc.desc Test TextPickerDialogOptionsExt.backgroundEffect property (BackgroundEffectOptions)
     */
    it('textPickerDialogBackgroundEffect', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogBackgroundEffect START');
      let effect: BackgroundEffectOptions = { radius: 10, saturation: 1, brightness: 1 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], backgroundEffect: effect };
      expect(opts.backgroundEffect !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_023
     * @tc.name textPickerDialogShadow
     * @tc.desc Test TextPickerDialogOptionsExt.shadow property (ShadowOptions)
     */
    it('textPickerDialogShadow', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogShadow START');
      // ShadowOptions.radius is required (number | Resource); offsetX/offsetY are optional
      let shadow: ShadowOptions = { radius: 20, offsetX: 5, offsetY: 5 };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], shadow: shadow };
      expect(opts.shadow !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_024
     * @tc.name textPickerDialogEnableHoverMode
     * @tc.desc Test TextPickerDialogOptionsExt.enableHoverMode property
     */
    it('textPickerDialogEnableHoverMode', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogEnableHoverMode START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], enableHoverMode: true };
      expect(opts.enableHoverMode).assertEqual(true);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_025
     * @tc.name textPickerDialogHoverModeArea
     * @tc.desc Test TextPickerDialogOptionsExt.hoverModeArea property (HoverModeAreaType enum)
     */
    it('textPickerDialogHoverModeArea', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogHoverModeArea START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], hoverModeArea: HoverModeAreaType.TOP_SCREEN };
      expect(opts.hoverModeArea !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_026
     * @tc.name textPickerDialogEnableHapticFeedback
     * @tc.desc Test TextPickerDialogOptionsExt.enableHapticFeedback property
     */
    it('textPickerDialogEnableHapticFeedback', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogEnableHapticFeedback START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], enableHapticFeedback: false };
      expect(opts.enableHapticFeedback).assertEqual(false);
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_027
     * @tc.name textPickerDialogSelectedBackgroundStyle
     * @tc.desc Test TextPickerDialogOptionsExt.selectedBackgroundStyle property (PickerBackgroundStyle)
     */
    it('textPickerDialogSelectedBackgroundStyle', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogSelectedBackgroundStyle START');
      // borderRadius?: LengthMetrics | BorderRadiuses | LocalizedBorderRadiuses
      let bgStyle: PickerBackgroundStyle = { color: Color.Blue, borderRadius: LengthMetrics.vp(4) };
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'], selectedBackgroundStyle: bgStyle };
      expect(opts.selectedBackgroundStyle !== undefined).assertTrue();
      done();
    });

    /**
     * @tc.number TextPickerAttributeTest_028
     * @tc.name textPickerDialogOptionsExtUndefinedProps
     * @tc.desc Test TextPickerDialogOptionsExt with optional properties absent (all undefined)
     */
    it('textPickerDialogOptionsExtUndefinedProps', Level.LEVEL1, (done: () => void): void => {
      console.info('TextPickerAttributeTest execute: textPickerDialogOptionsExtUndefinedProps START');
      let opts: TextPickerDialogOptionsExt = { range: ['a', 'b'] };
      expect(opts.defaultPickerItemHeight === undefined).assertTrue();
      expect(opts.canLoop === undefined).assertTrue();
      expect(opts.enableHoverMode === undefined).assertTrue();
      expect(opts.enableHapticFeedback === undefined).assertTrue();
      done();
    });
  });
}
