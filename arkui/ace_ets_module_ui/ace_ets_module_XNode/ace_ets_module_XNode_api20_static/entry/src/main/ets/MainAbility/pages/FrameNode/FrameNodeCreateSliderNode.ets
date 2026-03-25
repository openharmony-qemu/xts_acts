'use static'

import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';
import {
  Entry,
  Component,
  Builder,
  NodeContainer,
  CheckBoxShape,
  Column,
  ColumnOptions,
  ImageAnalyzerType,
  CheckboxGroup,
  Checkbox,
  HorizontalAlign,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  ImageAIOptions,
  ImageAnalyzerController,
  ImageBitmap,
  ImageAnalyzerConfig,
  Text,
  Button,
  FontWeight,
  ClickEvent,
  Margin,
  Color,
  Row,
  RenderingContextSettings,
  CanvasRenderingContext2D,
  Canvas,
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext } from '@ohos.arkui.UIContext';

class MyNodeController extends NodeController {
  public errorCode: string = '';
  private worker: EAWorker = new EAWorker();
  private myNode: typeNode.Slider | null = null;

  constructor() {
    super();
    this.worker.start();
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createColumnNode(uiContext)
    col.initialize()
    this.worker.postTask(() => {
      try {
        let slider = typeNode.createSliderNode(uiContext, { supportMultiThread: true })
        slider.initialize()
        EAWorker.main().postTask(() => {
          col.appendChild(slider)
          this.myNode = slider;
          this.errorCode = 'createSliderNode success'
        })
      } catch (e) {
        this.errorCode = 'createSliderNode error: ' + e.message
      }
    })
    node.appendChild(col)
    return node
  }

  triggerError() {
    this.worker.postTask(() => {
      this.errorCode = ''
      try {
        this.myNode!.commonAttribute.backgroundColor('#ffffff00');
        this.errorCode = 'change slider backgroundColor success'
      } catch (e) {
        this.errorCode = 'change slider backgroundColor error'
      }
    })
    this.worker.quit();
  }
}

@Entry
@Component
struct createSliderNode {
  private myNodeController: MyNodeController = new MyNodeController()
  @State message: string = ''
  private timer: int = 0;

  aboutToAppear() {
    this.timer = setInterval(() => {
      if (this.myNodeController.errorCode != '') {
        this.message = this.myNodeController.errorCode;
        clearInterval(this.timer)
      }
    }, 800)
  }

  build() {
    Column({ space: 5 } as ColumnOptions) {
      NodeContainer(this.myNodeController).height('30%')
      Text(this.message).key('error_slider_key').height('30%')
      Button('error')
        .id('error_slider_id')
        .height('30%')
        .onClick(() => {
          this.timer = setInterval(() => {
            if (this.myNodeController.errorCode != '') {
              this.message = this.myNodeController.errorCode;
              clearInterval(this.timer)
            }
          }, 800)
          this.myNodeController.triggerError();
        })
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}