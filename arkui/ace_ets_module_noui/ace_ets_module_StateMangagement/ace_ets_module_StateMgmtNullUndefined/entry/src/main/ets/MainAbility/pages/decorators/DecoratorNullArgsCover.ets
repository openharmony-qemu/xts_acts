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

/**
 * Cover @Provider/@Consumer with null/undefined decorator args.
 * @Monitor(null|undefined) 不可测（运行时崩溃），已删除，见
 * null_undefined_compile_failures.md。
 */
@ComponentV2
struct DecoChildNullArgs {
  @Consumer(undefined) cUndef: number = 0;
  @Consumer(null) cNull: number = 0;

  build() {
    Column() {
      Text(`cUndef:${this.cUndef},cNull:${this.cNull}`)
        .id('deco_null_args_child')
        .height('5%')
    }
  }
}

@Entry
@ComponentV2
struct DecoratorNullArgsCover {
  @Provider(undefined) ageUndef: number = 1;
  @Provider(null) ageNull: number = 1;

  build() {
    Column() {
      Text('DecoratorNullArgsCover')
        .id('deco_null_args_title')
        .fontSize(16)
        .height('5%')
      Text(`ageUndef:${this.ageUndef},ageNull:${this.ageNull}`)
        .id('deco_null_args_provider')
        .height('5%')
      Button('bump')
        .id('deco_null_args_btn')
        .height('5%')
        .onClick(() => {
          this.ageUndef += 1;
          this.ageNull += 1;
        })
      DecoChildNullArgs()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
