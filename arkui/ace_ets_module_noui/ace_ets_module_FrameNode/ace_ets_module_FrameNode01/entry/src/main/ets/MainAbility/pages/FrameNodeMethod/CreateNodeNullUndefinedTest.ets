/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
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
import { FrameNode, NodeController, typeNode } from '@kit.ArkUI';

class MyProgressNodeController extends NodeController {
  public uiContext: UIContext | null = null;
  public rootNode: FrameNode | null = null;
  public controller: XComponentController = new XComponentController();
  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);
    let node = typeNode.createNode(uiContext, 'Progress');
    node.initialize({
      value: 15,
      total: 200,
      type: ProgressType.ScaleRing
    }).width(100)
      .height(100)

    try {
      typeNode.createNode(null, 'Column')
      console.info(`win6 Column`);
    } catch (err) {
      console.info(`win6 Column` + err.code);
      AppStorage.SetOrCreate('createNodeColumnNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Column')
      console.info(`win6 Column`);
    } catch (err) {
      console.info(`win6 Column` + err.code);
      AppStorage.SetOrCreate('createNodeColumnUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'Row')
      console.info(`win6 Row`);
    } catch (err) {
      console.info(`win6 Row` + err.code);
      AppStorage.SetOrCreate('createNodeRowNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Row')
      console.info(`win6 Row`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeRowUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'Stack')
      console.info(`win6 Stack`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeStackNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Stack')
      console.info(`win6 Stack`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeStackUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'GridRow')
      console.info(`win6 GridRow`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeGridRowNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'GridRow')
      console.info(`win6 GridRow`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeGridRowUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'GridCol')
      console.info(`win6 GridCol`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeGridColNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'GridCol')
      console.info(`win6 GridCol`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeGridColUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'Flex')
      console.info(`win6 Flex`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeFlexNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Flex')
      console.info(`win6 Flex`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeFlexUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'RelativeContainer')
      console.info(`win6 RelativeContainer`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeRelativeContainerNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'RelativeContainer')
      console.info(`win6 RelativeContainer`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeRelativeContainerUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'Divider')
      console.info(`win6 Divider`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeDividerNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Divider')
      console.info(`win6 Divider`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeDividerUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'Blank')
      console.info(`win6 Blank`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeBlankNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'Blank')
      console.info(`win6 Blank`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeBlankUndefined', err.code);
    }

    try {
      typeNode.createNode(null, 'XComponent')
      console.info(`win6 XComponent`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeXComponentNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'XComponent')
      console.info(`win6 XComponent`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeXComponentUndefined', err.code);
    }

    let options: XComponentOptions = {
      type: XComponentType.SURFACE,
      controller: this.controller
    };

    try {
      typeNode.createNode(null, 'XComponent', options)
      console.info(`win6 XComponent`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeXComponentThreeNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'XComponent', options)
      console.info(`win6 XComponent`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeXComponentThreeUndefined', err.code);
    }

    try {
      typeNode.createNode(uiContext, 'XComponent', null)
      console.info(`win6 XComponent`);
      AppStorage.SetOrCreate('createNodeXComponentOptionsNull', 'success');
    } catch (err) {
      console.info(`win6 ` + err.code);
    }

    try {
      typeNode.createNode(uiContext, 'XComponent', undefined)
      console.info(`win6 XComponent`);
      AppStorage.SetOrCreate('createNodeXComponentOptionsUndefined', 'success');
    } catch (err) {
      console.info(`win6 ` + err.code);
    }

    let parameters: NativeXComponentParameters = {
      type: XComponentType.SURFACE
    };

    try {
      typeNode.createNode(null, 'XComponent', parameters);
      console.info(`win6 XComponent`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeParametersThreeNull', err + '');
    }

    try {
      typeNode.createNode(undefined, 'XComponent', parameters);
      console.info(`win6 XComponent`);
    } catch (err) {
      console.info(`win6 ` + err.code);
      AppStorage.SetOrCreate('createNodeParametersThreeUndefined', err.code);
    }

    try {
      typeNode.createNode(uiContext, 'XComponent', null);
      console.info(`win6 XComponent`);
      AppStorage.SetOrCreate('createNodeXComponentParametersNull', 'success');
    } catch (err) {
      console.info(`win6 ` + err.code);
    }

    try {
      typeNode.createNode(uiContext, 'XComponent', undefined);
      console.info(`win6 XComponent`);
      AppStorage.SetOrCreate('createNodeXComponentParametersUndefined', 'success');
    } catch (err) {
      console.info(`win6 ` + err.code);
    }

    this!.rootNode!.appendChild(node);
    return this.rootNode;
  }
}

@Entry
@Component
struct createNodeNullIndex {
  build() {
    Column({ space: 10 }) {
      NodeContainer(new MyProgressNodeController()).margin(5)
    }.width('100%').height('100%')
  }
}