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
import nativeSourceType from 'libnativeSourceType.so';

@Entry
@Component
struct CapiSourceTypePage {
  @State statusText: string = 'CapiSourceType Ready';

  build() {
    Column() {
      Text(this.statusText)
        .fontSize(20)
        .fontColor(Color.Black)
        .margin({ top: 20 })

      XComponent({
        id: 'sourceType',
        type: 'node',
        libraryname: 'nativeSourceType'
      })
        .onAppear(() => {
          if (nativeSourceType && nativeSourceType.nativeSourceType) {
            try {
              nativeSourceType.nativeSourceType('sourceType', this.getUIContext());
            } catch (e) {
              console.error('nativeSourceType call error: ' + JSON.stringify(e));
            }
          } else {
            console.error('nativeSourceType module not available');
          }
        })
        .width('100%')
        .height('80%')
        .backgroundColor('#FFFAFA')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .justifyContent(FlexAlign.Center)
  }
}
