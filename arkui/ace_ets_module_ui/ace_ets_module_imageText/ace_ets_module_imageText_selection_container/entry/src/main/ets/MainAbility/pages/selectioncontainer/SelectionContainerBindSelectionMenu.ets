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
  ColorMetrics,
  OnMenuItemClickWithTextCallback,
  SelectionContainer,
  SelectionContainerAttribute,
  SelectionContainerEditMenuOptions,
  SelectionContainerInstance,
  SelectionContainerMenuOptions,
  SelectionContainerTextJoinStyle
} from '@kit.ArkUI';

@Entry
@Component
struct SelectionContainerBindSelectionMenu {
  @State menuVisible: boolean = false;
  @State onAppearText: string = '';
  @State onDisappearText: string = '';
  @State onMenuShowText: string = '';
  @State onMenuHideText: string = '';

  @Builder selectionMenuBuilder() {
    Column() {
      Text('Custom Selection Menu')
        .padding(10)
        .id('custom_selection_menu_text')
    }
  }

  build() {
    Column() {
      Text('外部区域')
        .height('20%')
        .copyOption(CopyOptions.InApp)
        .id('selectioncontainer_outside_area')
      Row(){
        Text(this.onAppearText).width('25%').id('selectioncontainer_onAppearText')
        Text(this.onDisappearText).width('25%').id('selectioncontainer_onDisappearText')
        Text(this.onMenuShowText).width('25%').id('selectioncontainer_onMenuShowText')
        Text(this.onMenuHideText).width('25%').id('selectioncontainer_onMenuHideText')
      }.height('5%')

      SelectionContainer() {
        Column() {
          Text('First text for SelectionContainerMenuOptions_null')
            .copyOption(CopyOptions.InApp)
          Text('Second text for SelectionContainerMenuOptions_null')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_selectionContainerMenuOptions_null')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.selectionMenuBuilder, TextResponseType.LONG_PRESS,
        {
          onAppear:null,
          onDisappear:null,
          onMenuShow:null,
          onMenuHide:null
        })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .height('10%')

      SelectionContainer() {
        Column() {
          Text('First text for SelectionContainerMenuOptions_undefined')
            .copyOption(CopyOptions.InApp)
          Text('Second text for SelectionContainerMenuOptions_undefined')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_selectionContainerMenuOptions_undefined')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.selectionMenuBuilder, TextResponseType.LONG_PRESS,
        {
          onAppear:undefined,
          onDisappear:undefined,
          onMenuShow:undefined,
          onMenuHide:undefined
        })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .height('10%')

      SelectionContainer() {
        Column() {
          Text('First text for bindSelectionMenu')
            .copyOption(CopyOptions.InApp)
          Text('Second text for bindSelectionMenu')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_bindselectionmenu')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(TextSpanType.TEXT, this.selectionMenuBuilder, TextResponseType.LONG_PRESS,
          {
            onAppear:()=>{this.onAppearText = 'true'},
            onDisappear:()=>{this.onDisappearText = 'true'},
            onMenuShow:()=>{this.onMenuShowText = 'true'},
            onMenuHide:()=>{this.onMenuHideText = 'true'}
          })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .height('10%')

      SelectionContainer() {
        Column() {
          Text('First text for bindSelectionMenu null')
            .copyOption(CopyOptions.InApp)
          Text('Second text for bindSelectionMenu null')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_bindselectionmenu_null')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(null, null, null, null)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })

      SelectionContainer() {
        Column() {
          Text('First text for bindSelectionMenu undefined')
            .copyOption(CopyOptions.InApp)
          Text('Second text for bindSelectionMenu undefined')
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_bindselectionmenu_undefined')
      .copyOption(CopyOptions.InApp)
      .bindSelectionMenu(undefined, undefined, undefined, undefined)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}
