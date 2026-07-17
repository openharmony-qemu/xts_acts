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

let entryOptsPara: Record<string, number> = { 'EntryProp': 1 };
let entryOptsStorage: LocalStorage = new LocalStorage(entryOptsPara);

/**
 * Cover Entry / EntryOptions / EntryOptions.storage via @Entry options.
 */
@Entry({
  routeName: 'EntryOptionsCover',
  storage: entryOptsStorage,
  useSharedStorage: false
})
@Component
struct EntryOptionsCover {
  @LocalStorageLink('EntryProp') entryProp: number = 0;

  build() {
    Column() {
      Text('EntryOptionsCover')
        .id('entry_options_cover_title')
        .fontSize(16)
        .height('5%')
      Text(`EntryProp:${this.entryProp}`)
        .id('entry_options_cover_prop')
        .height('5%')
      Button('inc')
        .id('entry_options_cover_btn')
        .height('5%')
        .onClick(() => {
          this.entryProp += 1;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
