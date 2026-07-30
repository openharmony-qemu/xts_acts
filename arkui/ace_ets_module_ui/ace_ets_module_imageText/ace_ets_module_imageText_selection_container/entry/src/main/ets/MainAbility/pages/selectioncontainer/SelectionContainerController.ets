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
import {
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerController
} from '@kit.ArkUI';


@Entry
@Component
struct SelectionContainerControllerTest {
  private closeMenuController: SelectionContainerController = new SelectionContainerController();
  private clearSelectionController: SelectionContainerController = new SelectionContainerController();
  @State menuHideFlag: string = 'false';
  @State clearMenuHideFlag: string = 'false';
  @State selectionClearedFlag: string = 'false';

  @Builder closeMenuBuilder() {
    Column() {
      Text('CustomMenuClose')
        .fontSize(8)
        .fontColor('#33ff00')
    }
  }

  @Builder clearMenuBuilder() {
    Column() {
      Text('CustomMenuClear')
        .fontSize(8)
        .fontColor('#33ff00')
    }
  }

  build() {
    Column({ space: 5 }) {
      Row(){
        Button('CloseSelectionMenu')
          .id('button_close_selection_menu')
          .onClick(() => {
            this.closeMenuController.closeSelectionMenu();
          }).width('50%')
        Button('ClearTextSelection')
          .id('button_clear_text_selection')
          .onClick(() => {
            this.clearSelectionController.clearTextSelection();
          }).width('50%')
      }.height('5%')

      Text(`selectionCleared: ${this.selectionClearedFlag}`)
        .id('text_selection_cleared_flag')
        .height('5%')
        .fontColor('#ff00ff')

      Text(`clearMenuHide: ${this.clearMenuHideFlag}`)
        .id('text_clear_menuhide_flag')
        .height('5%')
        .fontColor('#ff00ff')
      SelectionContainer({ controller: this.clearSelectionController }) {
        Column() {
          Text('ClearSelectionText1')
            .copyOption(CopyOptions.InApp)
            .fontColor('#5500ff')
          Text('ClearSelectionText2')
            .copyOption(CopyOptions.InApp)
            .fontColor('#5500ff')
        }
      }
      .id('selectioncontainer_clearselection')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.clearMenuBuilder, TextResponseType.LONG_PRESS,
        {
          onMenuHide: () => { this.clearMenuHideFlag = 'true' }
        })
      .onTextSelectionChange((value: Array<string>) => {
        if (value.length === 0) {
          this.selectionClearedFlag = 'true';
        }
      })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })

      Text(`menuHide: ${this.menuHideFlag}`)
        .id('text_menuhide_flag')
        .height('5%')
      SelectionContainer({ controller: this.closeMenuController }) {
        Column() {
          Text('CloseMenuText1')
            .copyOption(CopyOptions.InApp)
          Text('CloseMenuText2')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_closemenu')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.closeMenuBuilder, TextResponseType.LONG_PRESS,
        {
          onMenuHide: () => { this.menuHideFlag = 'true' }
        })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })

      SelectionContainer(null) {
        Column() {
          Text('NullOptionText1')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_null_options')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })

      SelectionContainer(undefined) {
        Column() {
          Text('UndefinedOptionText1')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_undefined_options')
      .copyOption(CopyOptions.InApp)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })

    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}
