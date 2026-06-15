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

import { SymbolGlyphModifier, uiMaterial } from '@kit.ArkUI';

function buildMenu(): Array<NavigationMenuItem> {
  return [
    {
      value: 'menu1',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_circle'))
    },
    {
      value: 'menu2',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_star'))
    },
    {
      value: 'menu3',
      symbolIcon: new SymbolGlyphModifier($r('sys.symbol.ohos_folder_badge_plus'))
    }
  ]
}

@Component
struct TestComponent {
  private arr: number[] = [];

  aboutToAppear(): void {
    for (let i = 0; i < 10; i++) {
      this.arr.push(i);
    }
  }

  build() {
    Scroll() {
      Column() {
        ForEach(this.arr, (item: number) => {
          Stack() {
            Text(item.toString())
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor((item % 2) == 1 ? '#fff5e4e4' : '#ff302a2a')
          }.width('100%')
          .height('30%')
          .backgroundColor((item % 2) == 0 ? '#fff5e4e4' : '#ff302a2a')
        }, (item: number) => item.toString())
      }
    }
  }
}

@Component
struct MyDest {
  build() {
    NavDestination() {
      TestComponent().width('100%').height('100%')
    }.width('100%').height('100%')
    .title('', {
      systemMaterial: new uiMaterial.ImmersiveMaterial({
        style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
        colorInvert: true,
        interactive: true,
        lightEffect: {}
      }),
      barStyle: BarStyle.STACK
    })
    .menus(buildMenu())
  }
}

@Entry
@Component
struct NavigationTitleMaterialDemo {
  private stack: NavPathStack = new NavPathStack();

  @Builder
  MyMap(name: string) {
    MyDest()
  }

  build() {
    Column() {
      Text('systemMaterial ULTRA_THIN').fontSize(10)
      Navigation(this.stack) {
        Column() {
          TestComponent()
            .width('100%')
        }.width('100%').height('100%')
      }
      .width('100%')
      .height('30%')
      .mode(NavigationMode.Stack)
      .navDestination(this.MyMap)
      .title('', {
        systemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.ULTRA_THIN,
          colorInvert: true,
          applyShadow: true,
          interactive: true,
          lightEffect: {}
        }),
        barStyle: BarStyle.STACK
      })
      .menus(buildMenu())

      Text('systemMaterial THIN').fontSize(10)
      Navigation(this.stack) {
        Column() {
          TestComponent()
            .width('100%')
        }.width('100%').height('100%')
      }
      .width('100%')
      .height('20%')
      .mode(NavigationMode.Stack)
      .navDestination(this.MyMap)
      .title('', {
        systemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.THIN,
          materialColor: '#80FF0000',
          colorInvert: false,
          applyShadow: false,
          interactive: false,
          lightEffect: { color: Color.White }
        }),
        barStyle: BarStyle.STACK
      })
      .menus(buildMenu())

      Text('systemMaterial REGULAR').fontSize(10)
      Navigation(this.stack) {
        Column() {
          TestComponent()
            .width('100%')
        }.width('100%').height('100%')
      }
      .width('100%')
      .height('20%')
      .mode(NavigationMode.Stack)
      .navDestination(this.MyMap)
      .title('', {
        systemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.REGULAR,
          materialColor: undefined,
          colorInvert: undefined,
          applyShadow: undefined,
          interactive: undefined,
          lightEffect: undefined
        }),
        barStyle: BarStyle.STACK
      })
      .menus(buildMenu())

      Text('systemMaterial ULTRA_THICK').fontSize(10)
      Navigation(this.stack) {
        Column() {
          TestComponent()
            .width('100%')
        }.width('100%').height('100%')
      }
      .width('100%')
      .height('20%')
      .mode(NavigationMode.Stack)
      .navDestination(this.MyMap)
      .title('', {
        systemMaterial: new uiMaterial.ImmersiveMaterial({
          style: uiMaterial.ImmersiveStyle.ULTRA_THICK,
          materialColor: null,
          colorInvert: null,
          applyShadow: null,
          interactive: null,
          lightEffect: null
        }),
        barStyle: BarStyle.STACK
      })
      .menus(buildMenu())

    }
    .width('100%')
    .height('100%')
  }
}