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
struct SelectionContainerEditMenuOptionsTest {
  build() {
    Column({ space: 5 }) {
      SelectionContainer() {
        Column({ space: 8 }) {
          Text('First text for editMenuOptions')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for editMenuOptions')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_editmenuoptions')
      .copyOption(CopyOptions.InApp)
      .editMenuOptions({
        onCreateMenu: (menuItems: Array<TextMenuItem>) => {
          return menuItems;
        },
        onMenuItemClick: (menuItem: TextMenuItem, value: string) => {
          return true;
        },
        onPrepareMenu:(menuItems: Array<TextMenuItem>)=>{
          return menuItems
        }
      })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Column({ space: 8 }) {
          Text('First text for editMenuOptions null')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for editMenuOptions null')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_editmenuoptions_null')
      .copyOption(CopyOptions.InApp)
      .editMenuOptions(null)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Column({ space: 8 }) {
          Text('First text for editMenuOptions undefined')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for editMenuOptions undefined')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_editmenuoptions_undefined')
      .copyOption(CopyOptions.InApp)
      .editMenuOptions(undefined)
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
      .padding(12)

      SelectionContainer() {
        Column() {
          Text('First text for editMenuOptions')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for editMenuOptions')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_editmenuoptions_all_null')
      .copyOption(CopyOptions.InApp)
      .editMenuOptions({
        onCreateMenu: null,
        onMenuItemClick: null,
        onPrepareMenu:null
      })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })

      SelectionContainer() {
        Column() {
          Text('First text for editMenuOptions')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
          Text('Second text for editMenuOptions')
            .fontSize(18)
            .copyOption(CopyOptions.InApp)
        }
      }
      .id('selectioncontainer_editmenuoptions_all_undefined')
      .copyOption(CopyOptions.InApp)
      .editMenuOptions({
        onCreateMenu: undefined,
        onMenuItemClick: undefined,
        onPrepareMenu:undefined
      })
      .width('100%')
      .border({ width: 1, color: '#DCDCDC' })
    }
    .width('100%')
    .height('100%')
    .padding(5)
    .backgroundColor('#F5F5F5')
  }
}
