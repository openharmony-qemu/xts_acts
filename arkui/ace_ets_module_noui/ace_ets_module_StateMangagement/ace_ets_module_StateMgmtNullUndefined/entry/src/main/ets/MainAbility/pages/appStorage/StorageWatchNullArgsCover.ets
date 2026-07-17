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

AppStorage.setOrCreate('DecoPropNull', 10);
AppStorage.setOrCreate('DecoLinkNull', 20);

let lsInit: Record<string, number> = { 'LsProp': 1, 'LsLink': 2 };
let lsStorage: LocalStorage = new LocalStorage(lsInit);

/**
 * Cover @StorageProp/@StorageLink/@LocalStorage* with null/undefined keys.
 * @Watch(null) 编译 ERROR，见 null_undefined_compile_failures.md。
 * @Watch(undefined) 仅 WARN，可编译，见下方 linkWatchUndef。
 */
@Entry({ storage: lsStorage, useSharedStorage: false })
@Component
struct StorageWatchNullArgsCover {
  @StorageProp(undefined) propUndef: number = 0;
  @StorageProp(null) propNull: number = 0;
  @StorageLink(undefined) @Watch('onLinkUndef') linkUndef: number = 0;
  @StorageLink(null) @Watch('onLinkNull') linkNull: number = 0;
  @State @Watch(undefined) linkWatchUndef: number = 0;
  @LocalStorageProp(undefined) lsPropUndef: number = 0;
  @LocalStorageProp(null) lsPropNull: number = 0;
  @LocalStorageLink(undefined) lsLinkUndef: number = 0;
  @LocalStorageLink(null) lsLinkNull: number = 0;
  @State watchHit: number = 0;

  onLinkUndef(): void {
    this.watchHit += 1;
  }

  onLinkNull(): void {
    this.watchHit += 1;
  }

  build() {
    Column() {
      Text('StorageWatchNullArgsCover')
        .id('storage_watch_null_title')
        .fontSize(16)
        .height('5%')
      Text(`prop:${this.propUndef}/${this.propNull}`)
        .id('storage_watch_null_prop')
        .height('5%')
      Text(`link:${this.linkUndef}/${this.linkNull}`)
        .id('storage_watch_null_link')
        .height('5%')
      Text(`ls:${this.lsPropUndef}/${this.lsLinkUndef}`)
        .id('storage_watch_null_ls')
        .height('5%')
      Button('changeLink')
        .id('storage_watch_null_btn')
        .height('5%')
        .onClick(() => {
          this.linkUndef += 1;
          this.linkNull += 1;
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
