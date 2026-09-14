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

@Entry
@Component
struct TextInputCalcWidth {
  build() {
    Column() {
      Row() {
        TextInput({ text: 'calc width' })
          .key('textInputCalcWidth')
          .width('calc(100% - 80vp)')
          .height(60)
        Text('delete')
          .key('textInputCalcWidthTrailing')
          .width(40)
          .height(40)
        Blank()
          .key('textInputCalcWidthBlank')
          .width(40)
      }
      .key('textInputCalcWidthRow')
      .width('100%')
      .height(80)
    }
    .width('100%')
    .height('100%')
  }
}
