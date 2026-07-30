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

@Entry
@Component
struct ContextMenuGridStyle {
  @State showTop: boolean = false;
  @State showBottom: boolean = false;
  @State showCount2: boolean = false;
  @State showCount4: boolean = false;
  @State showHSize: boolean = false;
  @State showCombined: boolean = false;
  @State lastAction: string = 'none';

  private gridItems(prefix: string): Array<MenuElement> {
    let names: string[] = ['Copy', 'Paste', 'Cut', 'Delete', 'Share', 'Select', 'Translate', 'Favorite'];
    let items: Array<MenuElement> = [];
    for (let i = 0; i < names.length; i++) {
      let name = prefix + names[i];
      items.push({
        value: name,
        action: (): void => {
          this.lastAction = name;
          this.showTop = false;
          this.showBottom = false;
          this.showCount2 = false;
          this.showCount4 = false;
          this.showHSize = false;
          this.showCombined = false;
        }
      });
    }
    return items;
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text('ContextMenuOptions.gridStyle').fontSize(18).fontWeight(FontWeight.Bold)
        Text('last=' + this.lastAction).id('grid_last_action')
        Button('grid TOP')
          .id('btn_grid_top')
          .onClick(() => {
            this.showTop = true;
          })
          .bindContextMenuByIsShow(this.showTop, this.gridItems('T_'), {
            gridStyle: {
              count: 4,
              horizontalSize: 3,
              position: MenuGridPosition.TOP
            },
            onWillDisappear: () => {
              this.showTop = false;
            }
          })
        Button('grid BOTTOM')
          .id('btn_grid_bottom')
          .onClick(() => {
            this.showBottom = true;
          })
          .bindContextMenuByIsShow(this.showBottom, this.gridItems('B_'), {
            gridStyle: {
              count: 4,
              horizontalSize: 3,
              position: MenuGridPosition.BOTTOM
            },
            onWillDisappear: () => {
              this.showBottom = false;
            }
          })
        Button('grid count=2')
          .id('btn_grid_count2')
          .onClick(() => {
            this.showCount2 = true;
          })
          .bindContextMenuByIsShow(this.showCount2, this.gridItems('C2_'), {
            gridStyle: {
              count: 2,
              position: MenuGridPosition.TOP
            },
            onWillDisappear: () => {
              this.showCount2 = false;
            }
          })
        Button('grid count=4')
          .id('btn_grid_count4')
          .onClick(() => {
            this.showCount4 = true;
          })
          .bindContextMenuByIsShow(this.showCount4, this.gridItems('C4_'), {
            gridStyle: {
              count: 4,
              position: MenuGridPosition.BOTTOM
            },
            onWillDisappear: () => {
              this.showCount4 = false;
            }
          })
        Button('grid horizontalSize=2')
          .id('btn_grid_hsize')
          .onClick(() => {
            this.showHSize = true;
          })
          .bindContextMenuByIsShow(this.showHSize, this.gridItems('H_'), {
            gridStyle: {
              count: 4,
              horizontalSize: 2,
              position: MenuGridPosition.TOP
            },
            onWillDisappear: () => {
              this.showHSize = false;
            }
          })
        Button('grid combined')
          .id('btn_grid_combined')
          .onClick(() => {
            this.showCombined = true;
          })
          .bindContextMenuByIsShow(this.showCombined, this.gridItems('M_'), {
            placement: Placement.Bottom,
            gridStyle: {
              count: 3,
              horizontalSize: 4,
              position: MenuGridPosition.BOTTOM
            },
            onWillDisappear: () => {
              this.showCombined = false;
            }
          })
      }
      .width('100%')
      .padding(16)
    }
    .width('100%')
    .height('100%')
  }
}
