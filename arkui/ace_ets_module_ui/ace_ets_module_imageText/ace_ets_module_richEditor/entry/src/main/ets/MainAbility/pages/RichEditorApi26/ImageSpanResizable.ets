/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { drawing } from '@kit.ArkGraphics2D';

@Entry
@Component
struct ImageSpanResizable {
  private sliceOpts: ResizableOptions = {
    slice: { left: 1, right: 1, top: 1, bottom: 1 }
  };
  private latticeOpts: ResizableOptions = {
    slice: { left: 1, right: 1, top: 1, bottom: 1 },
    lattice: drawing.Lattice.createImageLattice([1, 2, 4], [1, 2, 4], 3, 3)
  };

  @Builder
  spanBlock(spanId: string, opts: ResizableOptions | null | undefined, apply: boolean) {
    Text() {
      if (apply) {
        ImageSpan($r('app.media.icon'))
          .width(50)
          .height(50)
          .id(spanId)
          .resizable(opts as ResizableOptions)
      } else {
        ImageSpan($r('app.media.icon'))
          .width(50)
          .height(50)
          .id(spanId)
      }
    }
    .width('100%')
    .height('10%')
    .borderWidth(1)
    .borderColor(Color.Gray)
  }

  build() {
    Scroll() {
      Column({ space: 5 }) {
        this.spanBlock('imageSpan_resizable_default', undefined, false)
        this.spanBlock('imageSpan_resizable_slice', this.sliceOpts, true)
        this.spanBlock('imageSpan_resizable_lattice', this.latticeOpts, true)
        this.spanBlock('imageSpan_resizable_null', null, true)
        this.spanBlock('imageSpan_resizable_undefined', undefined, true)
      }
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}
