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

import { NodeController, FrameNode, typeNode, UIState } from '@kit.ArkUI';

class MyButtonModifier implements AttributeModifier<ButtonAttribute> {
  applyNormalAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor('#000000');
  }
  applyHoveredAttribute(instance: ButtonAttribute): void {
    instance.backgroundColor('#FF0000');
  }
}

class MyNodeController extends NodeController {
  private theStatesToBeSupported = UIState.NORMAL | UIState.HOVERED;

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext);
    node.commonAttribute.width('100%')
      .height('100%')
      .borderColor(Color.Gray)
      .borderWidth(1)

    let column = typeNode.createNode(uiContext, 'Column');
    column.initialize({ space: 20 })
      .width('100%')
      .height('100%')
    node.appendChild(column);

    let styleText = typeNode.createNode(uiContext, 'Text');
    styleText.initialize('HoverTarget')
      .width('80%')
      .height('15%')
      .margin({ top: 5, bottom: 5 })
      .fontColor(Color.White)
      .textAlign(TextAlign.Center)
      .backgroundColor(Color.Green)
      .borderWidth(2)
      .borderColor(Color.Black)
      .focusable(true)
      .id('frameNodeHoverText')

    styleText.addSupportedUIStates(this.theStatesToBeSupported, (node: FrameNode, currentState: number) => {
      if (currentState == UIState.NORMAL) {
        node.commonAttribute.backgroundColor(Color.Green)
        node.commonAttribute.borderWidth(2)
        node.commonAttribute.borderColor(Color.Black)
      }
      if ((currentState & UIState.HOVERED) == UIState.HOVERED) {
        node.commonAttribute.backgroundColor(Color.Blue)
      }
    }, false)

    column.appendChild(styleText);

    let buttonRemove = typeNode.createNode(uiContext, 'Button');
    buttonRemove.initialize('RemoveHover')
      .width('80%')
      .height('15%')
      .id('frameNodeRemoveBtn')
      .onClick(() => {
        styleText.removeSupportedUIStates(this.theStatesToBeSupported);
      });
    column.appendChild(buttonRemove);

    return node;
  }
}

@Entry
@Component
struct HoveredAttributeTest {
  @State modifier: MyButtonModifier = new MyButtonModifier();
  private myNodeController: MyNodeController = new MyNodeController();

  @Styles
  hoveredStyles(): void {
    .backgroundColor('#FF0000')
  }

  build() {
    Scroll() {
      Column({ space: '1%' }) {
        Text('HoveredAttribute Test')
          .width('90%')
          .textAlign(TextAlign.Center)
          .margin({ top: '2%' })

        Text('Area1: applyHoveredAttribute')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)

        Button('Modifier Hover')
          .id('modifierHoverBtn')
          .width('80%')
          .height('8%')
          .attributeModifier(this.modifier)

        Text('Area2: stateStyles hovered')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({ top: '5%' })

        Text('StateStyles Hover')
          .id('stateHoverText')
          .width('80%')
          .height('8%')
          .backgroundColor('#0000FF')
          .textAlign(TextAlign.Center)
          .stateStyles({
            hovered: this.hoveredStyles,
          })

        Text('Area3: addSupportedUIStates HOVERED')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({ top: '5%' })

        NodeContainer(this.myNodeController)
          .width('80%')
          .height('30%')

        Text('Area4: Move Out Button')
          .width('90%')
          .fontColor(Color.Gray)
          .textAlign(TextAlign.Center)
          .margin({ top: '5%' })

        Button('Move Mouse Out')
          .id('moveOutBtn')
          .width('80%')
          .height('8%')
          .backgroundColor('#FFFFFF')
          .borderWidth(1)
          .borderColor('#000000')

        Blank().height('5%')
      }
      .width('100%')
      .padding({ left: '5%', right: '5%' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }
}