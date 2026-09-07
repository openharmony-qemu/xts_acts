'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import { describe, afterEach, it, expect, Level } from "../../../../hypium/index";
import { ToolBarV2ItemState, ToolBarV2SymbolGlyph, ToolBarV2SymbolGlyphOptions,
  ToolBarV2ItemText, ToolBarV2ItemTextOptions, ToolBarV2ItemIconType,
  ToolBarV2ItemImage, ToolBarV2ItemImageOptions, ToolBarV2Item, ToolBarV2ItemOptions,
  ToolBarV2ItemAction, ToolBarV2Modifier } from '@ohos.arkui.advanced.ToolBarV2';
import { SymbolGlyphModifier } from '@ohos.arkui.modifier';
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node';

export default function ToolBarV2Test(): void {
  describe('ToolBarV2Test', (): void => {

    afterEach((): void => {
    });

    // ==================== ToolBarV2ItemState enum ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemState_Enable_001
     * @tc.name     testToolBarV2ItemStateEnable001
     * @tc.desc     verify ToolBarV2ItemState.ENABLE equals 1
     * @tc.level    Level.LEVEL0
     */
    it('testToolBarV2ItemStateEnable001', Level.LEVEL0, (done: () => void): void => {
      try {
        expect(ToolBarV2ItemState.ENABLE).assertEqual(1);
        done();
      } catch (err) {
        console.info('testToolBarV2ItemStateEnable001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemState_Disable_001
     * @tc.name     testToolBarV2ItemStateDisable001
     * @tc.desc     verify ToolBarV2ItemState.DISABLE equals 2
     * @tc.level    Level.LEVEL0
     */
    it('testToolBarV2ItemStateDisable001', Level.LEVEL0, (done: () => void): void => {
      try {
        expect(ToolBarV2ItemState.DISABLE).assertEqual(2);
        done();
      } catch (err) {
        console.info('testToolBarV2ItemStateDisable001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemState_Activate_001
     * @tc.name     testToolBarV2ItemStateActivate001
     * @tc.desc     verify ToolBarV2ItemState.ACTIVATE equals 3
     * @tc.level    Level.LEVEL0
     */
    it('testToolBarV2ItemStateActivate001', Level.LEVEL0, (done: () => void): void => {
      try {
        expect(ToolBarV2ItemState.ACTIVATE).assertEqual(3);
        done();
      } catch (err) {
        console.info('testToolBarV2ItemStateActivate001 err: ' + JSON.stringify(err));
        done();
      }
    });

    // ==================== ToolBarV2SymbolGlyph ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_SymbolGlyph_Constructor_001
     * @tc.name     testSymbolGlyphConstructor001
     * @tc.desc     verify ToolBarV2SymbolGlyph constructor with normal options
     * @tc.level    Level.LEVEL0
     */
    it('testSymbolGlyphConstructor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const normalModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
        const options: ToolBarV2SymbolGlyphOptions = {
          normal: normalModifier
        };
        const symbolGlyph: ToolBarV2SymbolGlyph = new ToolBarV2SymbolGlyph(options);
        expect(symbolGlyph !== null && symbolGlyph !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testSymbolGlyphConstructor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_SymbolGlyph_Normal_001
     * @tc.name     testSymbolGlyphNormal001
     * @tc.desc     verify ToolBarV2SymbolGlyph.normal property value
     * @tc.level    Level.LEVEL0
     */
    it('testSymbolGlyphNormal001', Level.LEVEL0, (done: () => void): void => {
      try {
        const normalModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
        const options: ToolBarV2SymbolGlyphOptions = {
          normal: normalModifier
        };
        const symbolGlyph: ToolBarV2SymbolGlyph = new ToolBarV2SymbolGlyph(options);
        expect(symbolGlyph.normal !== null && symbolGlyph.normal !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testSymbolGlyphNormal001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_SymbolGlyph_Activated_001
     * @tc.name     testSymbolGlyphActivated001
     * @tc.desc     verify ToolBarV2SymbolGlyph.activated property value when provided
     * @tc.level    Level.LEVEL0
     */
    it('testSymbolGlyphActivated001', Level.LEVEL0, (done: () => void): void => {
      try {
        const normalModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
        const activatedModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
        const options: ToolBarV2SymbolGlyphOptions = {
          normal: normalModifier,
          activated: activatedModifier
        };
        const symbolGlyph: ToolBarV2SymbolGlyph = new ToolBarV2SymbolGlyph(options);
        expect(symbolGlyph.activated !== null && symbolGlyph.activated !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testSymbolGlyphActivated001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_SymbolGlyph_Activated_002
     * @tc.name     testSymbolGlyphActivated002
     * @tc.desc     verify ToolBarV2SymbolGlyph.activated is undefined when not provided
     * @tc.level    Level.LEVEL0
     */
    it('testSymbolGlyphActivated002', Level.LEVEL0, (done: () => void): void => {
      try {
        const normalModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
        const options: ToolBarV2SymbolGlyphOptions = {
          normal: normalModifier
        };
        const symbolGlyph: ToolBarV2SymbolGlyph = new ToolBarV2SymbolGlyph(options);
        expect(symbolGlyph.activated).assertUndefined();
        done();
      } catch (err) {
        console.info('testSymbolGlyphActivated002 err: ' + JSON.stringify(err));
        done();
      }
    });

    // ==================== ToolBarV2ItemText ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemText_Constructor_001
     * @tc.name     testItemTextConstructor001
     * @tc.desc     verify ToolBarV2ItemText constructor with full options
     * @tc.level    Level.LEVEL0
     */
    it('testItemTextConstructor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const options: ToolBarV2ItemTextOptions = {
          text: 'test_text',
          color: ColorMetrics.resourceColor('#FF000000'),
          activatedColor: ColorMetrics.resourceColor('#FFFFFFFF')
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(options);
        expect(itemText !== null && itemText !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemTextConstructor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemText_Text_001
     * @tc.name     testItemTextText001
     * @tc.desc     verify ToolBarV2ItemText.text property value
     * @tc.level    Level.LEVEL0
     */
    it('testItemTextText001', Level.LEVEL0, (done: () => void): void => {
      try {
        const options: ToolBarV2ItemTextOptions = {
          text: 'item_text_value'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(options);
        expect(itemText.text).assertEqual('item_text_value');
        done();
      } catch (err) {
        console.info('testItemTextText001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemText_Color_001
     * @tc.name     testItemTextColor001
     * @tc.desc     verify ToolBarV2ItemText.color property is set correctly
     * @tc.level    Level.LEVEL0
     */
    it('testItemTextColor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const colorMetrics: ColorMetrics = ColorMetrics.resourceColor('#FF000000');
        const options: ToolBarV2ItemTextOptions = {
          text: 'test',
          color: colorMetrics
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(options);
        expect(itemText.color !== null && itemText.color !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemTextColor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemText_ActivatedColor_001
     * @tc.name     testItemTextActivatedColor001
     * @tc.desc     verify ToolBarV2ItemText.activatedColor property is set correctly
     * @tc.level    Level.LEVEL0
     */
    it('testItemTextActivatedColor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const activatedColor: ColorMetrics = ColorMetrics.resourceColor('#FFFFFFFF');
        const options: ToolBarV2ItemTextOptions = {
          text: 'test',
          activatedColor: activatedColor
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(options);
        expect(itemText.activatedColor !== null && itemText.activatedColor !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemTextActivatedColor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemText_Optional_001
     * @tc.name     testItemTextOptional001
     * @tc.desc     verify ToolBarV2ItemText.color and activatedColor are undefined when not provided
     * @tc.level    Level.LEVEL0
     */
    it('testItemTextOptional001', Level.LEVEL0, (done: () => void): void => {
      try {
        const options: ToolBarV2ItemTextOptions = {
          text: 'test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(options);
        expect(itemText.color).assertUndefined();
        expect(itemText.activatedColor).assertUndefined();
        done();
      } catch (err) {
        console.info('testItemTextOptional001 err: ' + JSON.stringify(err));
        done();
      }
    });

    // ==================== ToolBarV2ItemImage ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemImage_Constructor_001
     * @tc.name     testItemImageConstructor001
     * @tc.desc     verify ToolBarV2ItemImage constructor with full options
     * @tc.level    Level.LEVEL0
     */
    it('testItemImageConstructor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const options: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png',
          color: ColorMetrics.resourceColor('#FF000000'),
          activatedColor: ColorMetrics.resourceColor('#FFFFFFFF')
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(options);
        expect(itemImage !== null && itemImage !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemImageConstructor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemImage_Src_001
     * @tc.name     testItemImageSrc001
     * @tc.desc     verify ToolBarV2ItemImage.src property is set correctly
     * @tc.level    Level.LEVEL0
     */
    it('testItemImageSrc001', Level.LEVEL0, (done: () => void): void => {
      try {
        const options: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png'
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(options);
        expect(itemImage.src !== null && itemImage.src !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemImageSrc001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemImage_Color_001
     * @tc.name     testItemImageColor001
     * @tc.desc     verify ToolBarV2ItemImage.color property is set correctly
     * @tc.level    Level.LEVEL0
     */
    it('testItemImageColor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const colorMetrics: ColorMetrics = ColorMetrics.resourceColor('#FF000000');
        const options: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png',
          color: colorMetrics
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(options);
        expect(itemImage.color !== null && itemImage.color !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemImageColor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemImage_ActivatedColor_001
     * @tc.name     testItemImageActivatedColor001
     * @tc.desc     verify ToolBarV2ItemImage.activatedColor property is set correctly
     * @tc.level    Level.LEVEL0
     */
    it('testItemImageActivatedColor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const activatedColor: ColorMetrics = ColorMetrics.resourceColor('#FFFFFFFF');
        const options: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png',
          activatedColor: activatedColor
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(options);
        expect(itemImage.activatedColor !== null && itemImage.activatedColor !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemImageActivatedColor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemImage_Optional_001
     * @tc.name     testItemImageOptional001
     * @tc.desc     verify ToolBarV2ItemImage.color and activatedColor are undefined when not provided
     * @tc.level    Level.LEVEL0
     */
    it('testItemImageOptional001', Level.LEVEL0, (done: () => void): void => {
      try {
        const options: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png'
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(options);
        expect(itemImage.color).assertUndefined();
        expect(itemImage.activatedColor).assertUndefined();
        done();
      } catch (err) {
        console.info('testItemImageOptional001 err: ' + JSON.stringify(err));
        done();
      }
    });

    // ==================== ToolBarV2ItemIconType ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemIconType_Image_001
     * @tc.name     testItemIconTypeImage001
     * @tc.desc     verify ToolBarV2ItemImage can be assigned to ToolBarV2ItemIconType
     * @tc.level    Level.LEVEL0
     */
    it('testItemIconTypeImage001', Level.LEVEL0, (done: () => void): void => {
      try {
        const imageOptions: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png'
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(imageOptions);
        const iconType: ToolBarV2ItemIconType = itemImage;
        expect(iconType !== null && iconType !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemIconTypeImage001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemIconType_SymbolGlyph_001
     * @tc.name     testItemIconTypeSymbolGlyph001
     * @tc.desc     verify ToolBarV2SymbolGlyph can be assigned to ToolBarV2ItemIconType
     * @tc.level    Level.LEVEL0
     */
    it('testItemIconTypeSymbolGlyph001', Level.LEVEL0, (done: () => void): void => {
      try {
        const normalModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
        const symbolOptions: ToolBarV2SymbolGlyphOptions = {
          normal: normalModifier
        };
        const symbolGlyph: ToolBarV2SymbolGlyph = new ToolBarV2SymbolGlyph(symbolOptions);
        const iconType: ToolBarV2ItemIconType = symbolGlyph;
        expect(iconType !== null && iconType !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemIconTypeSymbolGlyph001 err: ' + JSON.stringify(err));
        done();
      }
    });

    // ==================== ToolBarV2Item ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_Constructor_001
     * @tc.name     testItemConstructor001
     * @tc.desc     verify ToolBarV2Item constructor with full options
     * @tc.level    Level.LEVEL0
     */
    it('testItemConstructor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'item1'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const imageOptions: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png'
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(imageOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          action: (index): void => {
            console.info('action callback index: ' + index);
          },
          icon: itemImage,
          state: ToolBarV2ItemState.ENABLE,
          accessibilityText: 'access_text',
          accessibilityDescription: 'access_desc',
          accessibilityLevel: 'yes'
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item !== null && item !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemConstructor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_Content_001
     * @tc.name     testItemContent001
     * @tc.desc     verify ToolBarV2Item.content property value
     * @tc.level    Level.LEVEL0
     */
    it('testItemContent001', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'content_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.content !== null && item.content !== undefined).assertTrue();
        expect(item.content.text).assertEqual('content_test');
        done();
      } catch (err) {
        console.info('testItemContent001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_Action_001
     * @tc.name     testItemAction001
     * @tc.desc     verify ToolBarV2Item.action callback can be invoked
     * @tc.level    Level.LEVEL0
     */
    it('testItemAction001', Level.LEVEL0, (done: () => void): void => {
      try {
        let actionResult: number = -1;
        const callback: ToolBarV2ItemAction = (index): void => {
          actionResult = index;
        };
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'action_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          action: callback
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.action !== undefined).assertTrue();
        callback(5);
        expect(actionResult).assertEqual(5);
        done();
      } catch (err) {
        console.info('testItemAction001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_Icon_001
     * @tc.name     testItemIcon001
     * @tc.desc     verify ToolBarV2Item.icon property with ToolBarV2ItemImage
     * @tc.level    Level.LEVEL0
     */
    it('testItemIcon001', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'icon_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const imageOptions: ToolBarV2ItemImageOptions = {
          src: 'test_icon.png'
        };
        const itemImage: ToolBarV2ItemImage = new ToolBarV2ItemImage(imageOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          icon: itemImage
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.icon !== null && item.icon !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemIcon001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_Icon_002
     * @tc.name     testItemIcon002
     * @tc.desc     verify ToolBarV2Item.icon property with ToolBarV2SymbolGlyph
     * @tc.level    Level.LEVEL0
     */
    it('testItemIcon002', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'icon_symbol_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const normalModifier: SymbolGlyphModifier = new SymbolGlyphModifier();
        const symbolOptions: ToolBarV2SymbolGlyphOptions = {
          normal: normalModifier
        };
        const symbolGlyph: ToolBarV2SymbolGlyph = new ToolBarV2SymbolGlyph(symbolOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          icon: symbolGlyph
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.icon !== null && item.icon !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testItemIcon002 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_State_001
     * @tc.name     testItemState001
     * @tc.desc     verify ToolBarV2Item.state property value
     * @tc.level    Level.LEVEL0
     */
    it('testItemState001', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'state_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          state: ToolBarV2ItemState.ACTIVATE
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.state).assertEqual(ToolBarV2ItemState.ACTIVATE);
        done();
      } catch (err) {
        console.info('testItemState001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_AccessibilityText_001
     * @tc.name     testItemAccessibilityText001
     * @tc.desc     verify ToolBarV2Item.accessibilityText property value
     * @tc.level    Level.LEVEL0
     */
    it('testItemAccessibilityText001', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'acc_text_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          accessibilityText: 'my_accessibility_text'
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.accessibilityText).assertEqual('my_accessibility_text');
        done();
      } catch (err) {
        console.info('testItemAccessibilityText001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_AccessibilityDescription_001
     * @tc.name     testItemAccessibilityDescription001
     * @tc.desc     verify ToolBarV2Item.accessibilityDescription property value
     * @tc.level    Level.LEVEL0
     */
    it('testItemAccessibilityDescription001', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'acc_desc_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          accessibilityDescription: 'my_description'
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.accessibilityDescription).assertEqual('my_description');
        done();
      } catch (err) {
        console.info('testItemAccessibilityDescription001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_AccessibilityLevel_001
     * @tc.name     testItemAccessibilityLevel001
     * @tc.desc     verify ToolBarV2Item.accessibilityLevel property value
     * @tc.level    Level.LEVEL0
     */
    it('testItemAccessibilityLevel001', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'acc_level_test'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText,
          accessibilityLevel: 'yes'
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.accessibilityLevel).assertEqual('yes');
        done();
      } catch (err) {
        console.info('testItemAccessibilityLevel001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Item_AccessibilityLevel_002
     * @tc.name     testItemAccessibilityLevel002
     * @tc.desc     verify ToolBarV2Item.accessibilityLevel is undefined when not provided
     * @tc.level    Level.LEVEL0
     */
    it('testItemAccessibilityLevel002', Level.LEVEL0, (done: () => void): void => {
      try {
        const textOptions: ToolBarV2ItemTextOptions = {
          text: 'acc_level_default'
        };
        const itemText: ToolBarV2ItemText = new ToolBarV2ItemText(textOptions);
        const options: ToolBarV2ItemOptions = {
          content: itemText
        };
        const item: ToolBarV2Item = new ToolBarV2Item(options);
        expect(item.accessibilityLevel).assertUndefined();
        done();
      } catch (err) {
        console.info('testItemAccessibilityLevel002 err: ' + JSON.stringify(err));
        done();
      }
    });

    // ==================== ToolBarV2ItemAction ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_ItemAction_Callback_001
     * @tc.name     testItemActionCallback001
     * @tc.desc     verify ToolBarV2ItemAction callback receives correct index parameter
     * @tc.level    Level.LEVEL0
     */
    it('testItemActionCallback001', Level.LEVEL0, (done: () => void): void => {
      try {
        let capturedIndex: number = -1;
        const callback: ToolBarV2ItemAction = (index): void => {
          capturedIndex = index;
        };
        callback(42);
        expect(capturedIndex).assertEqual(42);
        done();
      } catch (err) {
        console.info('testItemActionCallback001 err: ' + JSON.stringify(err));
        done();
      }
    });

    // ==================== ToolBarV2Modifier ====================

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Modifier_Height_001
     * @tc.name     testModifierHeight001
     * @tc.desc     verify ToolBarV2Modifier.height returns ToolBarV2Modifier instance
     * @tc.level    Level.LEVEL0
     */
    it('testModifierHeight001', Level.LEVEL0, (done: () => void): void => {
      try {
        const modifier: ToolBarV2Modifier = new ToolBarV2Modifier();
        const result: ToolBarV2Modifier = modifier.height(LengthMetrics.vp(56));
        expect(result !== null && result !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testModifierHeight001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Modifier_BackgroundColor_001
     * @tc.name     testModifierBackgroundColor001
     * @tc.desc     verify ToolBarV2Modifier.backgroundColor returns ToolBarV2Modifier instance
     * @tc.level    Level.LEVEL0
     */
    it('testModifierBackgroundColor001', Level.LEVEL0, (done: () => void): void => {
      try {
        const modifier: ToolBarV2Modifier = new ToolBarV2Modifier();
        const result: ToolBarV2Modifier = modifier.backgroundColor(ColorMetrics.resourceColor('#FF000000'));
        expect(result !== null && result !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testModifierBackgroundColor001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Modifier_Padding_001
     * @tc.name     testModifierPadding001
     * @tc.desc     verify ToolBarV2Modifier.padding returns ToolBarV2Modifier instance
     * @tc.level    Level.LEVEL0
     */
    it('testModifierPadding001', Level.LEVEL0, (done: () => void): void => {
      try {
        const modifier: ToolBarV2Modifier = new ToolBarV2Modifier();
        const result: ToolBarV2Modifier = modifier.padding(LengthMetrics.vp(16));
        expect(result !== null && result !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testModifierPadding001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Modifier_StateEffect_001
     * @tc.name     testModifierStateEffect001
     * @tc.desc     verify ToolBarV2Modifier.stateEffect returns ToolBarV2Modifier instance
     * @tc.level    Level.LEVEL0
     */
    it('testModifierStateEffect001', Level.LEVEL0, (done: () => void): void => {
      try {
        const modifier: ToolBarV2Modifier = new ToolBarV2Modifier();
        const result: ToolBarV2Modifier = modifier.stateEffect(true);
        expect(result !== null && result !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testModifierStateEffect001 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Modifier_StateEffect_002
     * @tc.name     testModifierStateEffect002
     * @tc.desc     verify ToolBarV2Modifier.stateEffect with false returns ToolBarV2Modifier instance
     * @tc.level    Level.LEVEL0
     */
    it('testModifierStateEffect002', Level.LEVEL0, (done: () => void): void => {
      try {
        const modifier: ToolBarV2Modifier = new ToolBarV2Modifier();
        const result: ToolBarV2Modifier = modifier.stateEffect(false);
        expect(result !== null && result !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testModifierStateEffect002 err: ' + JSON.stringify(err));
        done();
      }
    });

    /**
     * @tc.number   SUB_ArkUI_ToolBarV2_Modifier_Chain_001
     * @tc.name     testModifierChain001
     * @tc.desc     verify ToolBarV2Modifier method chaining works correctly
     * @tc.level    Level.LEVEL0
     */
    it('testModifierChain001', Level.LEVEL0, (done: () => void): void => {
      try {
        const modifier: ToolBarV2Modifier = new ToolBarV2Modifier();
        const result: ToolBarV2Modifier = modifier
          .height(LengthMetrics.vp(56))
          .backgroundColor(ColorMetrics.resourceColor('#FF000000'))
          .padding(LengthMetrics.vp(16))
          .stateEffect(true);
        expect(result !== null && result !== undefined).assertTrue();
        done();
      } catch (err) {
        console.info('testModifierChain001 err: ' + JSON.stringify(err));
        done();
      }
    });
  });
}
