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

import { ComposeTitleBarV2, ComposeTitleBarV2MenuItem, ComposeTitleBarV2MenuItemParams } from '@ohos.arkui.advanced.ComposeTitleBarV2';
import { SymbolGlyphModifier } from '@kit.ArkUI'

@Entry
@ComponentV2
struct ComposeTitleBarV2Example {
  @Local title: string = '标题';
  @Local subtitle: string = '副标题';
  @Local isMenuEnabled: boolean = true;
  @Local clickCount: number = 0;
  @Local clickCount2: number = 0;
  @Local clickCount3: number = 0;
  @Local menuItemParamsOptions:ComposeTitleBarV2MenuItemParams = {
    value: $r('sys.symbol.phone'),
    symbolStyle: new SymbolGlyphModifier($r('sys.symbol.save')).fontColor([Color.Blue]),
    isEnabled: true,
    label: 'label',
    accessibilityText: '文本',
    accessibilityLevel: 'yes',
    accessibilityDescription: '无障碍描述',
    action: () => {
      this.clickCount++;
      console.info('菜单项1点击，次数: ' + this.clickCount3);
    }
  }
  @Local menuItem:ComposeTitleBarV2MenuItem = new ComposeTitleBarV2MenuItem(this.menuItemParamsOptions)

  build() {
    Column() {
      Scroll() {
        Column() {
          Text('基本用法 - 仅标题')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)

          ComposeTitleBarV2({
            title: '基本标题',
          })

          Text('完整用法 - 标题+副标题')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
           

          ComposeTitleBarV2({
            title: '完整标题',
            subtitle: '副标题内容',
          })

          Text('左侧头像项')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            

          ComposeTitleBarV2({
            title: '带头像的标题',
            subtitle: '副标题',
            item: new ComposeTitleBarV2MenuItem({
              value: $r('sys.symbol.bell'),
              action: () => {
                console.info('左侧头像项点击');
              }
            }),
            menuItems: [this.menuItem],
          })

          Text('右侧菜单项')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            

          ComposeTitleBarV2({
            title: '带菜单的标题',
            subtitle: '副标题',
            menuItems: [
              new ComposeTitleBarV2MenuItem({
                value: $r('sys.symbol.phone'),
                isEnabled: this.isMenuEnabled,
                action: () => {
                  this.clickCount++;
                  console.info('菜单项1点击，次数: ' + this.clickCount);
                }
              }),
              new ComposeTitleBarV2MenuItem({
                value: $r('sys.symbol.share'),
                action: () => {
                  console.info('菜单项2点击');
                }
              })
            ]
          })

          Text('动态属性测试')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            

          ComposeTitleBarV2({
            title: this.title,
            subtitle: this.subtitle,
            menuItems: [
              new ComposeTitleBarV2MenuItem({
                value: $r('sys.symbol.more'),
                isEnabled: this.isMenuEnabled,
                action: () => {
                  this.title = '标题已更改';
                  this.subtitle = '副标题已更新';
                }
              })
            ]
          })

          Button('切换菜单启用状态')
            .onClick(() => {
              this.isMenuEnabled = !this.isMenuEnabled;
            })
            

          Text('所有属性组合')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            
          ComposeTitleBarV2({
            title: '完整功能标题',
            subtitle: '展示所有属性',
            item: new ComposeTitleBarV2MenuItem({
              value: $r('sys.symbol.more'),
              label: '更多',
              accessibilityText: '更多选项',
              accessibilityLevel: 'auto',
              accessibilityDescription: '点击查看更多选项',
              action: () => {
                console.info('左侧项点击');
              }
            }),
            menuItems: [
              new ComposeTitleBarV2MenuItem({
                value: $r('sys.symbol.more'),
                label: '菜单1',
                isEnabled: true,
                accessibilityText: '菜单项1',
                action: () => {
                  console.info('菜单项1点击');
                }
              }),
              new ComposeTitleBarV2MenuItem({
                value: $r('sys.symbol.phone'),
                symbolStyle: new SymbolGlyphModifier($r('sys.symbol.save')).fontColor([Color.Blue]),
                isEnabled: false,
                label: '菜单2',
                accessibilityText: '文本',
                accessibilityLevel: 'yes',
                accessibilityDescription: '无障碍描述',
                action: () => {
                  this.clickCount++;
                  console.info('菜单项2点击，次数: ' + this.clickCount2);
                }
              })
            ]
          })
        }
        .alignItems(HorizontalAlign.Center)
        .width('100%')
      }
     }
     .width('100%')
     .height('100%')
  }
}