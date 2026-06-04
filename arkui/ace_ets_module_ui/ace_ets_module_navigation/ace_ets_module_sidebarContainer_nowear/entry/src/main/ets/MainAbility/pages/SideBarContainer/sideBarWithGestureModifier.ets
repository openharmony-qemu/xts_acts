/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { SideBarContainerModifier } from '@ohos.arkui.modifier';

class SideBarModifier implements AttributeModifier<SideBarContainerModifier> {
  public isEnableGesture: boolean = false;

  applyNormalAttribute(instance: SideBarContainerModifier): void {
    instance.showSideBarWithGesture(this.isEnableGesture)
  }
}

@Entry
@Component
struct showSideBarWithGestureModifier {
  @State directories: Array<string> = ['文档', '图片', '视频']
  @State currentDir: string = '文档'
  @State btText: string = '+'
  @State changeTxt: string = 'init'
  @State barDirection: SideBarPosition = SideBarPosition.Start;
  @State modifier: SideBarModifier = new SideBarModifier();

  build() {
    SideBarContainer(SideBarContainerType.DISPLACE) {
      Column() {
        ForEach(this.directories, (dir: string) => {
          Text(dir)
            .fontSize(16)
            .padding(12)
            .backgroundColor(this.currentDir === dir ? '#E0F0FF' : '#F5F5F5')
            .onClick(() => {
              this.currentDir = dir
            })
        }, (dir: string) => dir)
      }.padding({ top: 32 })
      .width('100%')
      .backgroundColor('#F8F9FA')

      Column() {
        Text(`当前目录: ${this.currentDir}`)
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .padding(16)
        Column() {
          Row() {
            Image($r('app.media.icon')).width(32)
            Text('AABB')
          }.margin({ left: 15, top: 10 })

          Text('showSideBarWithGesture')
          Button('true')
            .id('showSideBarWithGesture_modifier_true')
            .onClick(() => {
              this.modifier.isEnableGesture = true
            })
          Button('false')
            .id('showSideBarWithGesture_modifier_false')
            .onClick(() => {
              this.modifier.isEnableGesture = false
            })

          Text('onChange: ' + this.changeTxt)
            .id('showSideBarWithGesture_modifier_changeTxt')
        }
      }
      .width('100%')
      .backgroundColor('#FFFFFF')
    }
    .showSideBar(false)
    .controlButton({
      left: 10,
      top: 10,
      icons: {
        hidden: $r('app.media.icon'),
        shown: $r('app.media.icon'),
        switching: $r('app.media.icon')
      }
    })
    .sideBarWidth(120)
    .minSideBarWidth(100)
    .maxSideBarWidth(150)
    .minContentWidth(0)
    .onChange((value: boolean) => {
      console.info('status:' + value);
    })
    .divider({
      strokeWidth: '1vp',
      color: Color.Gray,
      startMargin: '2vp',
      endMargin: '2vp'
    })
    .sideBarPosition(this.barDirection)
    .onChange((value:boolean)=>{
      if (value) {
        this.changeTxt = 'Show sidebar'
      } else {
        this.changeTxt = 'Hide sidebar'
      }
    })
    .attributeModifier(this.modifier)
    .id('showSideBarWithGesture_modifier')
  }
}