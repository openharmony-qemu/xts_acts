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
import { Entry, Component, Column, ColumnOptions, $r, Image, } from '@ohos.arkui.component'
import { State, } from '@ohos.arkui.stateManagement'
import drawing from '@ohos.graphics.drawing';

@Entry
@Component
struct ImageResizable {
  @State top: number = 40
  @State bottom: number = 5
  @State left: number = 40
  @State right: number = 10
  @State xDivs: Array<Number> = new Array<Number>(1, 2, 4)
  @State yDivs: Array<Number> = new Array<Number>(1, 2, 4)

  build() {
    Column({ space: 5 } as ColumnOptions) {
      Image($r('app.media.icon'))
        .key('ImageResizable_Image1')
        .resizable({
          slice: {
            left: this.left,
            right: this.right,
            top: this.top,
            bottom: this.bottom
          },
          lattice: drawing.Lattice.createImageLattice(this.xDivs, this.yDivs, 3, 3)
        })
        .onAccessibilityHover((): void => {
          console.log('onAccessibilityHover')
        })
        .width(200)
        .height(200)
    }
  }
}