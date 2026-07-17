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

@ReusableV2
@ComponentV2
struct ReuseCoverChild {
  @Require @Param label: string;

  build() {
    Text(`child:${this.label}`)
      .id(`reuse_cover_child_${this.label}`)
      .height('5%')
  }
}

/**
 * Cover ReuseOptions via .reuse({ reuseId }).
 */
@Entry
@ComponentV2
struct ReuseOptionsCover {
  @Local showChild: boolean = true;
  @Local reuseIdVal: string = 'reuseGroup';

  build() {
    Column() {
      Text('ReuseOptionsCover')
        .id('reuse_options_cover_title')
        .fontSize(16)
        .height('5%')
      Button('toggle')
        .id('reuse_options_cover_btn')
        .height('5%')
        .onClick(() => {
          this.showChild = !this.showChild;
        })
      if (this.showChild) {
        ReuseCoverChild({ label: 'A' })
          .reuse({ reuseId: () => this.reuseIdVal })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
