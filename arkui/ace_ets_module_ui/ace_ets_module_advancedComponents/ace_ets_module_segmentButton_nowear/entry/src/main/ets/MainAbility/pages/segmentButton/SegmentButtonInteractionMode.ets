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

import {
  SegmentButton, SegmentButtonOptions, CommonSegmentButtonOptions,
  SegmentButtonInteractionMode
} from '@ohos.arkui.advanced.SegmentButton';
import {
  TabSegmentButtonV2, CapsuleSegmentButtonV2, SegmentButtonV2Items,
  SegmentButtonV2InteractionMode
} from '@ohos.arkui.advanced.SegmentButtonV2';
import { ColorMetrics, LengthMetrics } from '@ohos.arkui.node';
import uiMaterial from '@ohos.arkui.uiMaterial';

@Entry
@Component
struct SegmentButtonInteractionModeTest {
  private light: uiMaterial.LightEffectOptions = { color: '#FFFFC857' };
  private material: uiMaterial.Material = new uiMaterial.ImmersiveMaterial({
    style: uiMaterial.ImmersiveStyle.THIN,
    applyShadow: true,
    interactive: true,
    lightEffect: this.light
  });
  private items: SegmentButtonV2Items = new SegmentButtonV2Items([
    { text: 'A' }, { text: 'B' }, { text: 'C' }
  ]);
  @State v1TabSelected: number[] = [0];
  @State v1CapsuleSelected: number[] = [0];
  @State v2TabSelected: number = 0;
  @State v2CapsuleSelected: number = 0;
  @State clickCount: number = 0;
  @State lastClick: string = '尚未点击';
  @State useMaterial: boolean = false;
  @State scene: string = '非材质跟手';
  @State v2Mode: SegmentButtonV2InteractionMode | undefined =
    SegmentButtonV2InteractionMode.FOLLOWING_DRAG;
  @State tabOptions: SegmentButtonOptions = this.createTabOptions(
    false, SegmentButtonInteractionMode.FOLLOWING_DRAG);
  @State capsuleOptions: SegmentButtonOptions = this.createCapsuleOptions(
    false, SegmentButtonInteractionMode.FOLLOWING_DRAG);

  private createTabOptions(useMaterial: boolean,
    mode: SegmentButtonInteractionMode | undefined): SegmentButtonOptions {
    const common: CommonSegmentButtonOptions = {
      interactionMode: mode,
      backgroundColor: useMaterial ? Color.Transparent : undefined,
      backgroundSystemMaterial: useMaterial ? this.material : undefined
    };
    return SegmentButtonOptions.tab({
      buttons: [{ text: 'A' }, { text: 'B' }, { text: 'C' }],
      interactionMode: common.interactionMode,
      backgroundColor: common.backgroundColor,
      backgroundSystemMaterial: common.backgroundSystemMaterial
    });
  }

  private createCapsuleOptions(useMaterial: boolean,
    mode: SegmentButtonInteractionMode | undefined): SegmentButtonOptions {
    const options: SegmentButtonOptions = SegmentButtonOptions.capsule({
      buttons: [{ text: 'A' }, { text: 'B' }, { text: 'C' }],
      multiply: false,
      backgroundColor: useMaterial ? Color.Transparent : undefined,
      backgroundSystemMaterial: useMaterial ? this.material : undefined
    });
    options.interactionMode = mode;
    return options;
  }

  private reset(): void {
    this.v1TabSelected = [0];
    this.v1CapsuleSelected = [0];
    this.v2TabSelected = 0;
    this.v2CapsuleSelected = 0;
    this.clickCount = 0;
    this.lastClick = '尚未点击';
  }

  private applyScene(label: string, useMaterial: boolean,
    v1Mode: SegmentButtonInteractionMode | undefined,
    v2Mode: SegmentButtonV2InteractionMode | undefined): void {
    this.useMaterial = useMaterial;
    this.v2Mode = v2Mode;
    this.tabOptions = this.createTabOptions(useMaterial, v1Mode);
    this.capsuleOptions = this.createCapsuleOptions(useMaterial, v1Mode);
    this.scene = label;
    this.reset();
  }

  private recordClick(component: string, index: number): void {
    this.clickCount++;
    this.lastClick = component + ': ' + index.toString();
  }

  @Builder
  private titleArea() {
    Column({ space: 3 }) {
      Text('V1 页签 selected=' + this.v1TabSelected.toString()).height(15).id('SegmentBtnInter_v1TabText')
      SegmentButton({
        options: this.tabOptions,
        selectedIndexes: $v1TabSelected,
        onItemClicked: (index: number) => { this.recordClick('V1 页签', index); }
      }).id('SegmentBtnInter_v1TabBtn')
      Text('V1 胶囊 selected=' + this.v1CapsuleSelected.toString()).height(15).id('SegmentBtnInter_v1CapsuleText')
      SegmentButton({
        options: this.capsuleOptions,
        selectedIndexes: $v1CapsuleSelected,
        onItemClicked: (index: number) => { this.recordClick('V1 胶囊', index); }
      }).id('SegmentBtnInter_v1CapsuleBtn')
      Text('V2 页签 selected=' + this.v2TabSelected.toString()).height(15).id('SegmentBtnInter_v2TabText')
      TabSegmentButtonV2({
        items: this.items,
        selectedIndex: this.v2TabSelected,
        $selectedIndex: (index: number) => { this.v2TabSelected = index; },
        onItemClicked: (index: number) => { this.recordClick('V2 页签', index); },
        interactionMode: this.v2Mode,
        itemMinHeight: LengthMetrics.vp(40),
        buttonMinHeight: LengthMetrics.vp(44),
        buttonBackgroundColor: this.useMaterial ? ColorMetrics.resourceColor(Color.Transparent) : undefined,
        backgroundSystemMaterial: this.useMaterial ? this.material : undefined
      }).id('SegmentBtnInter_v2TabBtn')
      Text('V2 胶囊 selected=' + this.v2CapsuleSelected.toString()).height(15).id('SegmentBtnInter_v2CapsuleText')
      CapsuleSegmentButtonV2({
        items: this.items,
        selectedIndex: this.v2CapsuleSelected,
        $selectedIndex: (index: number) => { this.v2CapsuleSelected = index; },
        onItemClicked: (index: number) => { this.recordClick('V2 胶囊', index); },
        interactionMode: this.v2Mode,
        itemMinHeight: LengthMetrics.vp(40),
        buttonMinHeight: LengthMetrics.vp(44),
        buttonBackgroundColor: this.useMaterial ? ColorMetrics.resourceColor(Color.Transparent) : undefined,
        backgroundSystemMaterial: this.useMaterial ? this.material : undefined
      }).id('SegmentBtnInter_v2CapsuleBtn')
      Text('V1 Tab interactionMode=' + (this.tabOptions.interactionMode == undefined ? 'undefined' : this.tabOptions.interactionMode.toString())).height(15).id('SegmentBtnInter_v1TabModeText')
      Text('V1 Capsule interactionMode=' + (this.capsuleOptions.interactionMode == undefined ? 'undefined' : this.capsuleOptions.interactionMode.toString())).height(15).id('SegmentBtnInter_v1CapsuleModeText')
      Text('V2 interactionMode=' + (this.v2Mode == undefined ? 'undefined' : this.v2Mode.toString())).height(15).id('SegmentBtnInter_v2ModeText')
    }.width('100%')
  }

  build() {
    Navigation() {
      Scroll() {
        Column({ space: 3 }) {
          Text('当前场景：' + this.scene).height(15).id('SegmentBtnInter_sceneText')
          Text('点击次数=' + this.clickCount.toString() + '；最近点击=' + this.lastClick).height(15).id('SegmentBtnInter_clickInfoText')

        Row(){
          Button('非材质跟手')
            .onClick(() => {
              this.applyScene('非材质跟手', false,
              SegmentButtonInteractionMode.FOLLOWING_DRAG,
              SegmentButtonV2InteractionMode.FOLLOWING_DRAG);
              })
              .width(100)
              .height(15)
              .id('SegmentBtnInter_btnFollowingNoMaterial')

          Button('新材质普通')
            .onClick(() => {
              this.applyScene('新材质普通', true,
              SegmentButtonInteractionMode.NORMAL_DRAG,
              SegmentButtonV2InteractionMode.NORMAL_DRAG);
            })
            .width(100)
            .height(15)
            .id('SegmentBtnInter_btnNormalNewMaterial')
        }

        Row(){
          Button('非材质缺省')
            .onClick(() => {
              this.applyScene('非材质缺省', false, undefined, undefined);
            })
            .width(100)
            .height(15)
            .id('SegmentBtnInter_btnDefaultNoMaterial')

          Button('新材质缺省')
            .onClick(() => {
              this.applyScene('新材质缺省', true, undefined, undefined);
            })
            .width(100)
            .height(15)
            .id('SegmentBtnInter_btnDefaultNewMaterial')
        }

        Row(){
          Button('非材质普通')
            .onClick(() => {
              this.applyScene('非材质普通', false,
              SegmentButtonInteractionMode.NORMAL_DRAG,
              SegmentButtonV2InteractionMode.NORMAL_DRAG);
            })
            .width(100)
            .height(15)
            .id('SegmentBtnInter_btnNormalNoMaterial')

          Button('新材质跟手')
            .onClick(() => {
              this.applyScene('新材质跟手', true,
              SegmentButtonInteractionMode.FOLLOWING_DRAG,
              SegmentButtonV2InteractionMode.FOLLOWING_DRAG);
            })
            .width(100)
            .height(15)
            .id('SegmentBtnInter_btnFollowingNewMaterial')
        }

        Row(){
          Button('重置到 A')
            .onClick(() => { this.reset(); })
            .width(100)
            .height(15)
            .id('SegmentBtnInter_btnReset')
        }

          Text('A/B/C 对应索引 0/1/2。先选场景，再从已选 A 慢拖到 B 并保持按下。').height(15).id('SegmentBtnInter_tipText1')
          Text('普通模式跨项更新选中；跟手模式按下时保留 A，正常释放后提交 B。').height(15).id('SegmentBtnInter_tipText2')
          Text('拖动不增加点击次数；真实点击或重复点击各增加一次。').height(15).id('SegmentBtnInter_tipText3')

        }.width('80%').height('80%')
      }
    }
    .title({ builder: this.titleArea, height: 380 })
    .titleMode(NavigationTitleMode.Full)
    .hideBackButton(true)
    .mode(NavigationMode.Stack)
    .width('100%').height('100%');
  }
}
