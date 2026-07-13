import { ComponentContent } from '@kit.ArkUI';


export interface TestResult {
  label: string;
  expectedCode: number;
  expectedDesc: string;
  actualCode: number;
  actualDesc: string;
  passed: boolean;
}

export const ERROR_DESC: Record<number, string> = {
  0: '成功',
  401: '参数错误',
  100001: '内部错误',
  103301: '弹窗内容错误',
  103302: '弹窗内容已存在',
  103303: '弹窗内容未找到',
  103306: '弹窗节点挂载失败',
};

export function makeResult(label: string, expectedCode: number, actualCode: number): TestResult {
  return {
    label,
    expectedCode,
    expectedDesc: ERROR_DESC[expectedCode] ?? `未知(${expectedCode})`,
    actualCode,
    actualDesc: ERROR_DESC[actualCode] ?? `未知(${actualCode})`,
    passed: expectedCode == actualCode,
  };
}

class TextParams {
  public text: string = '';
  constructor(text: string) {
    this.text = text;
  }
}

@Builder
export function commonTextBuilder(params: TextParams) {
  Column() {
    Text(params.text)
      .fontSize(20)
      .margin(20)
  }
  .width('80%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(10)
}

export { TextParams };

export class DialogMessageBody {
  public content: string = '';
  constructor(content: string) {
    this.content = content;
  }
}

export class DialogButtonBody {
  public value: string = '';
  public action: () => void = (): void => {};
  constructor(value: string, action: () => void) {
    this.value = value;
    this.action = action;
  }
}

export class DialogSheetBody {
  public title: string = '';
  public action: () => void = (): void => {};
  constructor(title: string, action: () => void) {
    this.title = title;
    this.action = action;
  }
}

export class SimpleDialogOptions {
  public title: string = '';
  public message?: DialogMessageBody;
  public buttons?: DialogButtonBody[];
  public sheets?: DialogSheetBody[];
  public showInSubWindow?: boolean;
}

export interface DialogPresentResult {
  dialogId: number;
}
