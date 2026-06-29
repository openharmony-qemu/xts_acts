'use static';
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
import { 
    SelectionMenu, EditorMenuOptions, ExpandedMenuOptions, 
    EditorEventInfo, SelectionMenuOptions 
} from '@ohos.arkui.advanced.SelectionMenu';
import {
  Entry,Component,RichEditorController,Color,Builder,Column,
  Scroll,RichEditor,RichEditorSpanType,RichEditorResponseType,ColumnOptions,
} from '@kit.ArkUI';
import { uiMaterial } from '@kit.ArkUI';

@Entry
@Component
struct SelectionMenuBackgroundSystemMaterial {
  controllerDefault: RichEditorController = new RichEditorController();
  controllerUndefined: RichEditorController = new RichEditorController();
  controllerUltraThin: RichEditorController = new RichEditorController();
  controllerUltraThick: RichEditorController = new RichEditorController();
  controllerRegular: RichEditorController = new RichEditorController();
  controllerMultiOpts: RichEditorController = new RichEditorController();
  controllerEmpty: RichEditorController = new RichEditorController();

  private optsDefault: SelectionMenuOptions = {
    controller: this.controllerDefault,
  };

  private optsUndefined: SelectionMenuOptions = {
    controller: this.controllerUndefined,
    backgroundSystemMaterial: undefined,
  };

  private optsUltraThin: SelectionMenuOptions = {
    controller: this.controllerUltraThin,
    backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
      style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
    }),
  };

  private optsUltraThick: SelectionMenuOptions = {
    controller: this.controllerUltraThick,
    backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
      style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
    }),
  };

  private optsRegular: SelectionMenuOptions = {
    controller: this.controllerRegular,
    backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial(),
  };

  private optsMultiOpts: SelectionMenuOptions = {
    controller: this.controllerMultiOpts,
    backgroundSystemMaterial: new uiMaterial.ImmersiveMaterial({
      style: uiMaterial.ImmersiveStyle.THIN,
      materialColor: '#80FF0000',
      colorInvert: true,
      applyShadow: false,
      interactive: true,
      lightEffect: { color: Color.White },
    }),
  };

  @Builder
  MenuDefault() {
    Column() {
      SelectionMenu(this.optsDefault)
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }


  @Builder
  MenuUndefined() {
    Column() {
      SelectionMenu(this.optsUndefined)
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  @Builder
  MenuUltraThin() {
    Column() {
      SelectionMenu(this.optsUltraThin)
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  @Builder
  MenuUltraThick() {
    Column() {
      SelectionMenu(this.optsUltraThick)
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  @Builder
  MenuRegular() {
    Column() {
      SelectionMenu(this.optsRegular)
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  @Builder
  MenuMultiOpts() {
    Column() {
      SelectionMenu(this.optsMultiOpts)
    }
    .width(256)
    .backgroundColor(Color.Transparent)
  }

  build() {
    Scroll() {
      Column({ space: 5 } as ColumnOptions) {
        RichEditor({ controller: this.controllerDefault })
          .id('richEditor_bkgSysMat_default')
          .onReady(() => {
            this.controllerDefault.addTextSpan('DefaultMaterial', { style: { fontSize: 20 } });
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, () => {
            this.MenuDefault()
          }, RichEditorResponseType.LONG_PRESS)
          .height(80)
          .width('100%')
          .borderWidth(1)

        RichEditor({ controller: this.controllerUndefined })
          .id('richEditor_bkgSysMat_undefined')
          .onReady(() => {
            this.controllerUndefined.addTextSpan('UndefinedMaterial', { style: { fontSize: 20 } });
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, () => {
            this.MenuUndefined()
          }, RichEditorResponseType.LONG_PRESS)
          .height(80)
          .width('100%')
          .borderWidth(1)

        RichEditor({ controller: this.controllerUltraThin })
          .id('richEditor_bkgSysMat_ultraThin')
          .onReady(() => {
            this.controllerUltraThin.addTextSpan('UltraThinMaterial', { style: { fontSize: 20 } });
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, () => {
            this.MenuUltraThin()
          }, RichEditorResponseType.LONG_PRESS)
          .height(80)
          .width('100%')
          .borderWidth(1)

        RichEditor({ controller: this.controllerUltraThick })
          .id('richEditor_bkgSysMat_ultraThick')
          .onReady(() => {
            this.controllerUltraThick.addTextSpan('UltraThickMaterial', { style: { fontSize: 20 } });
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, () => {
            this.MenuUltraThick()
          }, RichEditorResponseType.LONG_PRESS)
          .height(80)
          .width('100%')
          .borderWidth(1)

        RichEditor({ controller: this.controllerRegular })
          .id('richEditor_bkgSysMat_regular')
          .onReady(() => {
            this.controllerRegular.addTextSpan('RegularMaterial', { style: { fontSize: 20 } });
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, () => {
            this.MenuRegular()
          }, RichEditorResponseType.LONG_PRESS)
          .height(80)
          .width('100%')
          .borderWidth(1)

        RichEditor({ controller: this.controllerMultiOpts })
          .id('richEditor_bkgSysMat_multiOpts')
          .onReady(() => {
            this.controllerMultiOpts.addTextSpan('MultiOptsMaterial', { style: { fontSize: 20 } });
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, () => {
            this.MenuMultiOpts()
          }, RichEditorResponseType.LONG_PRESS)
          .height(80)
          .width('100%')
          .borderWidth(1)

        RichEditor({ controller: this.controllerEmpty })
          .id('richEditor_bkgSysMat_empty')
          .onReady(() => {
            this.controllerEmpty.addTextSpan('EmptyMaterial', { style: { fontSize: 20 } });
          })
          .bindSelectionMenu(RichEditorSpanType.TEXT, () => {
          }, RichEditorResponseType.LONG_PRESS)
          .height(80)
          .width('100%')
          .borderWidth(1)
      }
      .padding(5)
      .backgroundColor('#F5F5F5')
    }
    .height('100%')
    .width('100%')
  }
}
