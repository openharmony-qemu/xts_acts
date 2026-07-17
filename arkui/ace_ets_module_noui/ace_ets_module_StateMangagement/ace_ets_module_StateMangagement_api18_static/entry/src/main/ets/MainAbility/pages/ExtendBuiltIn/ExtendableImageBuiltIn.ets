'use static'
/*
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
import { ExtendableImage, Length, LayoutPolicy, Entry, Component, Column, ImageAIOptions, PixelMap, ResourceStr, ImageContent, ImageFit, Alignment, Color, $r } from '@kit.ArkUI';

class MyImage extends ExtendableImage {
  // 通用属性
  setImageOptions(src: PixelMap | ResourceStr | ImageContent | undefined, imageAIOptions?: ImageAIOptions): this{
    super.setImageOptions(src);
    // 添加自定义行为，如打印日志
    console.info('MyColumn: setImageOptions');
    return this;
  }
  width(): this {
    super.width('100%');
    return this;
  }

  // 自定义属性
  newAttribute(): this {
    super.height('50%');
    super.margin(15)
    return this;
  }
}

@Entry
@Component
struct ExtendableImageBuiltIn {
  build() {
    Column() {
      // 调用扩展组件
      MyImage($r('app.media.startIcon'))
        .id('ExtendableImage_001')
        .width() // 调用重写属性
        .newAttribute() // 调用自定义属性
        .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        .border({ width: 2, color: Color.Pink })
        .objectFit(ImageFit.TOP_START)
      MyImage(undefined)
        .id('ExtendableImage_002')
        .width() // 调用重写属性
        .newAttribute() // 调用自定义属性
        .overlay('png', { align: Alignment.Bottom, offset: { x: 0, y: 20 } })
        .border({ width: 2, color: Color.Pink })
        .objectFit(ImageFit.TOP_START)
    }
  }
}


