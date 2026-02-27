'use static'
import {
  Text,
  Column,
  Component,
  UIContext,
  Builder,
  Entry,
  Row,
  wrapBuilder,
  NodeContainer,
  FontWeight
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { NodeController, BuilderNode, FrameNode } from '@ohos.arkui.node';

class Params {
  text: string = "";

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .id('text')
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
  }
}

class TextNodeController extends NodeController {
  private textNode: BuilderNode<Params> | null = null;
  private message: string = "DEFAULT";

  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    this.textNode = new BuilderNode<Params>(context);
    this.textNode!.build(wrapBuilder(buildText), new Params(this.message));
    return this.textNode!.getFrameNode();
  }
}

@Entry
@Component
struct Index {
  @State message: string = "hello";

  build() {
    Row() {
      Column() {
        NodeContainer(new TextNodeController(this.message))
          .width('100%')
          .height(100)
          .backgroundColor('#FFF0F0F0')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}