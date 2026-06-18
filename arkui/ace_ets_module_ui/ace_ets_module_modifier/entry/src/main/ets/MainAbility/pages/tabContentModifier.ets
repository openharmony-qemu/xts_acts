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
import { TabsModifier } from '@ohos.arkui.modifier';

class MyTabContentModifier implements AttributeModifier<TabContentAttribute> {
  public indicatorWidth: number = 40;
  public indicatorHeight: number = 10;
  public indicatorBorderRadius: number = 5;
  public indicatorSpace: number = 10;

  applyNormalAttribute(instance: TabContentAttribute): void {
    instance.tabBar(SubTabBarStyle.of('文本1')
      .indicator({
        height: this.indicatorHeight,
        width: this.indicatorWidth,
        borderRadius: this.indicatorBorderRadius,
        marginTop: this.indicatorSpace
      }))
  }
}

@Entry
@Component
struct TabContentModifierComponent {
  @State myTabContentModifier: MyTabContentModifier = new MyTabContentModifier();
  private controller: TabsController = new TabsController()
  @State text: string = '文本';

  build() {
    Column(){
      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#00CB87')
        }.attributeModifier(this.myTabContentModifier)
        .id('tabContent_modifier_text')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#007DFF')
        }.tabBar(SubTabBarStyle.of(this.text + '2'))

        TabContent() {
          Column().width('100%').height('100%').backgroundColor('#FFBF00')
        }.tabBar(SubTabBarStyle.of(this.text + '3'))
      }
      .width(200)
      .height(200)
    }
  }
}