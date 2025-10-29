/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


import { BusinessError } from '@kit.BasicServicesKit';
import {
  ReactiveComponentContent,
  Binding,
  MutableBinding,
  UIContext,
  UIUtils,
  NodeController,
  FrameNode
} from '@kit.ArkUI';

//dispose
@Builder
function buildText(
  msgAge: MutableBinding<number>,
  message: MutableBinding<string>
) {
  Column() {
    Row() {
      Text(`age: ${msgAge.value}, text: ${message.value}`)
    }
  }
}

interface GeneratedObjectLiteralInterface_1 {
  msgAge: number;
  message: string;
}

const params: GeneratedObjectLiteralInterface_1 = {
  msgAge: 10,
  message: 'Mike',
};

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private contentNode: ReactiveComponentContent<[Binding<number>, Binding<string>]> | null = null;

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(context);
    this.contentNode = new ReactiveComponentContent <[Binding<number>, Binding<string>]>(context,
      wrapBuilder<[Binding<number>, Binding<string>]>(buildText),
      {},
      UIUtils.makeBinding<number>(() => params.msgAge, (val: number) => {
        params.msgAge = val
        console.log('NodeTest1 get', params.msgAge);
      }),
      UIUtils.makeBinding<string>(() => params.message, val => {
        console.log('NodeTest2 set before', params.message);
        params.message = val;
        console.log('NodeTest3 set after', params.message);
      }),
    );
    if (this.rootNode !== null) {
      this.rootNode.addComponentContent(this.contentNode);
    }
    return this.rootNode;
  }

  dispose() {
    if (this.contentNode !== null) {
      this.contentNode.dispose();
    }
  }

  // 检验当前Node是否已被释放
  isDisposed(): string {
    if (this.contentNode !== null) {
      if (this.contentNode.isDisposed()) {
        return 'true';
      } else {
        return 'false';
      }
    }
    return 'contentNode is null';
  }
}

@Entry
@Component
struct Index {
  @State text: string = ''
  private myNodeController: MyNodeController = new MyNodeController();

  build() {
    Row() {
      Column() {
        NodeContainer(this.myNodeController)
          .width('100%')
          .height(100)
          .backgroundColor('#FFF0F0F0')
        Button('ReactiveComponentContent dispose').id('dispose')
          .onClick(() => {
            this.myNodeController.dispose();
            this.text = '';
          })
          .width(200)
          .height(50)
        Button('ReactiveBuilderNode isDisposed').id('isDisposed')
          .onClick(() => {
            this.text = this.myNodeController.isDisposed();
            console.info('isDisposed :' + this.text)
          })
          .width(200)
          .height(50)
        Text(this.text)
          .id('isDisposedText')
          .fontSize(25)
      }
      .width('100%')
      .height('100%')
    }
  }
}