/**
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
import { ChipGroupV2, ChipGroupV2Item, ChipGroupV2Space, ChipGroupV2Padding } from '@kit.ArkUI';

@Entry
@Preview
@ComponentV2
struct ChipGroupV2ItemSpace {
  @Local selectedIndex: Array<number> = [0, 1, 2, 3, 4, 5, 6]
  @Local mChipGroupSpace: ChipGroupV2Space | undefined =
    new ChipGroupV2Space({ itemSpace: 8, endSpace: 10, startSpace: 20 })
  @Local mItemSpace: string = ''

  build() {
    Column() {
      Text('itemSpace:' + this.mItemSpace).id('itemSpace')
      Button('change')
        .id('change')
        .onClick(() => {
          this.mChipGroupSpace = new ChipGroupV2Space({ itemSpace: 20, endSpace: 30, startSpace: 40 })
        }).margin(20)
      Button('get')
        .id('get')
        .onClick(() => {
          this.mItemSpace = this.mChipGroupSpace?.itemSpace + ''
        })
      ChipGroupV2({
        items: [
          new ChipGroupV2Item({
            prefixIcon: { src: $r('app.media.icon') },
            label: { text: '操作块1' },
            suffixIcon: { src: $r('sys.media.ohos_ic_public_cut') },
            allowClose: false
          }),
          new ChipGroupV2Item({
            prefixIcon: { src: $r('sys.media.ohos_ic_public_copy') },
            label: { text: '操作块2' },
            allowClose: true
          }),
          new ChipGroupV2Item({
            prefixIcon: { src: $r('sys.media.ohos_ic_public_clock') },
            label: { text: '操作块3' },
            allowClose: true
          }),
        ],
        selectedIndexes: this.selectedIndex,
        multiple: false,
        chipGroupSpace: this.mChipGroupSpace,
        chipGroupPadding: new ChipGroupV2Padding({ top: 10, bottom: 10 }),
        onChange: (activatedChipsIndex: Array<number>) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        },
      }).id('ChipGroupV2')
    }
  }
}