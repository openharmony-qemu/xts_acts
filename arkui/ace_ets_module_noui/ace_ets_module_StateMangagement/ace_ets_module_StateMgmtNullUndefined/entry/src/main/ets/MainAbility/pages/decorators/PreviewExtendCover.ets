/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

@Extend(Text)
function textStyleNull(_color?: ResourceColor) {
  .fontSize(14)
}

/**
 * Cover @Preview / @Extend / @Component / @ComponentV2 / @ReusableV2（合法用法）。
 * 下列异常参数实测编不过，见 null_undefined_compile_failures.md：
 * @Extend(null|undefined)、@Preview(null|undefined)、@Component(null|undefined)、
 * @ComponentV2(null|undefined)、@ReusableV2(null|undefined)、@Entry(null)。
 */
@Preview
@Component
struct PreviewExtendChild {
  build() {
    Text('PreviewExtendChild')
      .textStyleNull()
      .id('preview_extend_child')
      .height('5%')
  }
}

@ObservedV2
class TypeSample {
  @Trace public num: number = 1;
}

@ReusableV2
@ComponentV2
struct ReusableTypeChild {
  @Require @Param label: string;

  build() {
    Text(`reuse:${this.label}`)
      .id('preview_extend_reuse')
      .height('5%')
  }
}

@Entry
@ComponentV2
struct PreviewExtendCover {
  @Local sample: TypeSample = new TypeSample();
  @Local show: boolean = true;

  build() {
    Column() {
      Text('PreviewExtendCover')
        .id('preview_extend_title')
        .fontSize(16)
        .height('5%')
      Text(`typeNum:${this.sample.num}`)
        .id('preview_extend_type')
        .height('5%')
      PreviewExtendChild()
      if (this.show) {
        ReusableTypeChild({ label: 'A' })
          .reuse({ reuseId: () => 'previewReuse' })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
