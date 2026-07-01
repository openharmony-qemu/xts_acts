/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct subMenuBuilderIndex {
  @State isShow: boolean = false;
  @State subMenuExpanded: string = 'none';
  @State clickResult: string = 'none';

  @Builder
  SubMenuA() {
    Menu() {
      MenuItem({ content: 'SubItemA1', labelInfo: 'A1' })
        .onClick(() => {
          this.clickResult = 'SubItemA1';
        })
      MenuItem({ content: 'SubItemA2', labelInfo: 'A2' })
        .onClick(() => {
          this.clickResult = 'SubItemA2';
        })
    }.id('subMenuA')
  }

  @Builder
  SubMenuB() {
    Menu() {
      MenuItem({ content: 'SubItemB1' })
      MenuItem({ content: 'SubItemB2' })
      MenuItem({ content: 'SubItemB3' })
    }.id('subMenuB')
  }

  @Builder
  SubMenuC() {
    Menu() {
      MenuItem({ content: 'SubItemC1' })
    }.id('subMenuC')
  }

  @Builder
  ParentMenuBuilder() {
    Menu() {
      MenuItem({ content: 'ItemNoSub' })
        .id('menuItemNoSub')
        .onClick(() => {
          this.clickResult = 'ItemNoSub';
        })
      MenuItem({ content: 'ItemWithSubA' })
        .id('menuItemWithSubA')
        .subMenuBuilder(this.SubMenuA)
      MenuItem({ content: 'ItemWithSubB' })
        .id('menuItemWithSubB')
        .subMenuBuilder(this.SubMenuB)
      MenuItem({ content: 'ItemSubUndefined' })
        .id('menuItemSubUndefined')
        .subMenuBuilder(undefined)
      MenuItem({ content: 'ItemChaining' })
        .id('menuItemChaining')
        .subMenuBuilder(this.SubMenuC)
        .selected(true)
        .selectIcon(true)
      MenuItem({ content: 'ItemSubReset' })
        .id('menuItemSubReset')
        .subMenuBuilder(this.SubMenuA)
    }.id('parentMenu')
  }

  build() {
    Column({ space: 20 }) {
      Button('ShowMenu')
        .id('showMenuBtn')
        .width(200)
        .height(50)
        .onClick(() => {
          this.isShow = !this.isShow;
        })
        .bindMenu(this.isShow, this.ParentMenuBuilder, {
          showInSubWindow: false,
          onDisappear: () => {
            this.isShow = false;
          },
        })

      Text('clickResult:' + this.clickResult)
        .id('clickResultText')
        .fontSize(14)

      Text('isShow:' + this.isShow)
        .id('isShowText')
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
