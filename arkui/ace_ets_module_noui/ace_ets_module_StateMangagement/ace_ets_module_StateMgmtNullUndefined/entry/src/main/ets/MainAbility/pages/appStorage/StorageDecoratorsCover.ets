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

AppStorage.setOrCreate('DecoProp', 10);
AppStorage.setOrCreate('DecoLink', 20);

/**
 * Cover @StorageProp / @StorageLink / @Watch (page load coverage).
 */
@Entry
@Component
struct StorageDecoratorsCover {
  @StorageProp('DecoProp') storProp: number = 0;
  @StorageLink('DecoLink') @Watch('onLinkChange') storLink: number = 0;
  @State watchCount: number = 0;

  onLinkChange(): void {
    this.watchCount += 1;
  }

  build() {
    Column() {
      Text('StorageDecoratorsCover')
        .id('storage_deco_cover_title')
        .fontSize(16)
        .height('5%')
      Text(`Prop:${this.storProp}`)
        .id('storage_deco_cover_prop')
        .height('5%')
      Text(`Link:${this.storLink}`)
        .id('storage_deco_cover_link')
        .height('5%')
      Text(`Watch:${this.watchCount}`)
        .id('storage_deco_cover_watch')
        .height('5%')
      Button('changeLink')
        .id('storage_deco_cover_btn')
        .height('5%')
        .onClick(() => {
          this.storLink += 1;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
