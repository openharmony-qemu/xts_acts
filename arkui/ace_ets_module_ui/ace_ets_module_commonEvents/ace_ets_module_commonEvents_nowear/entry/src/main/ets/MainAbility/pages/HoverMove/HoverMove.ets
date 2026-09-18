/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

@Entry
@Component
struct HoverMovePage {
  @State hoverX: number = -1;
  @State hoverY: number = -1;
  @State windowX: number = -1;
  @State windowY: number = -1;
  @State displayX: number = -1;
  @State displayY: number = -1;

  aboutToAppear(): void {
    AppStorage.setOrCreate('hoverX', -1);
    AppStorage.setOrCreate('hoverY', -1);
    AppStorage.setOrCreate('windowX', -1);
    AppStorage.setOrCreate('windowY', -1);
    AppStorage.setOrCreate('displayX', -1);
    AppStorage.setOrCreate('displayY', -1);
  }

  build() {
    Column() {
      Text('HoverMove Ready')
        .fontColor(Color.Black)

      Button('HoverMove')
        .id('hoverMoveBtn')
        .width('80%')
        .height('30%')
        .backgroundColor(0x317aff)
        .onHoverMove((event: HoverEvent) => {
          this.hoverX = event.x ?? -1;
          this.hoverY = event.y ?? -1;
          this.windowX = event.windowX ?? -1;
          this.windowY = event.windowY ?? -1;
          this.displayX = event.displayX ?? -1;
          this.displayY = event.displayY ?? -1;
          AppStorage.setOrCreate('hoverX', event.x ?? -1);
          AppStorage.setOrCreate('hoverY', event.y ?? -1);
          AppStorage.setOrCreate('windowX', event.windowX ?? -1);
          AppStorage.setOrCreate('windowY', event.windowY ?? -1);
          AppStorage.setOrCreate('displayX', event.displayX ?? -1);
          AppStorage.setOrCreate('displayY', event.displayY ?? -1);
        })

      Text('x:' + this.hoverX + ' y:' + this.hoverY)
        .fontSize(14)
        .fontColor(Color.Black)
        .margin(5)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .justifyContent(FlexAlign.Center)
  }
}
